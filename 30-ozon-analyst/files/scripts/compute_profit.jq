($post[0].result // []) as $orders
| ($cost[0] // {}) as $cost
| [ $orders[]
    | select((.status // "") | ascii_downcase | test("cancel") | not)
    | (.products // []) as $p
    | (.financial_data.products // []) as $f
    | range(0; ($p | length)) as $i
    | {
        offer: ($p[$i].offer_id // ($p[$i].sku | tostring)),
        sku: $p[$i].sku,
        name: ($p[$i].name // ""),
        qty: ($p[$i].quantity // 0),
        price: (($p[$i].price // "0") | tonumber),
        commission: ((($f[$i].commission_amount) // 0) | tonumber),
        payout: ((($f[$i].payout) // 0) | tonumber)
      }
  ] as $lines
| ($lines | group_by(.offer)) as $g
| [ $g[]
    | { offer: .[0].offer, sku: .[0].sku, name: .[0].name,
        units: (map(.qty) | add),
        revenue: (map(.price * .qty) | add),
        commission: (map(.commission) | add),
        ozon_net: (map(.payout) | add) }
    | . as $row
    | ($cost[$row.offer] // null) as $c
    | (if ($c == null or ($c.cost_unit | type) != "number") then null else ($row.units * ($c.cost_unit + (if (($c.extra_var) | type) == "number" then $c.extra_var else 0 end))) end) as $cogs
    | $row + {
        cogs: $cogs, ad_cost: 0,
        net_profit: (if $cogs == null then null else ($row.ozon_net - $cogs) end),
        margin_pct: (if ($row.revenue > 0 and $cogs != null) then (($row.ozon_net - $cogs) / $row.revenue * 100) else null end),
        drr_pct: (if $row.revenue > 0 then 0 else null end)
      }
  ] as $by
| ($by | map(select(.net_profit != null) | .net_profit) | add // 0) as $tnp
| {
    period: { days: 7 },
    totals: {
      orders: ($orders | map(select((.status // "") | ascii_downcase | test("cancel") | not)) | length),
      units: ($by | map(.units) | add // 0),
      revenue: ($by | map(.revenue) | add // 0),
      ozon_net: ($by | map(.ozon_net) | add // 0),
      net_profit: (if ($by | map(select(.net_profit != null)) | length) > 0 then $tnp else null end)
    },
    by_offer: [ $by[] | . + { profit_share_pct: (if ($tnp > 0 and .net_profit != null) then (.net_profit / $tnp * 100) else null end) } ],
    notes: (
      (if ($orders | length) == 0 then ["За период заказов нет"] else [] end)
      + (if ($by | map(select(.cogs == null)) | length) > 0 then ["Нет себестоимости для части SKU — прибыль по ним не посчитана"] else [] end)
    )
  }
