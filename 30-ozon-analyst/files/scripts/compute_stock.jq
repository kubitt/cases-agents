($stk[0].result.rows // []) as $rows
| ($prof[0].by_offer // []) as $pf
| ($clu[0] // {}) as $clu
| ($post[0].result // []) as $orders
| ($pf | map({ key: (.sku | tostring),
               value: { ads: ((.units // 0) / 7),
                        ppu: (if (.net_profit != null and .units > 0) then (.net_profit / .units) else null end) } })
       | from_entries) as $skuinfo
| [ $rows[]
    | ($skuinfo[(.sku | tostring)] // { ads: 0, ppu: null }) as $si
    | ($clu[.warehouse_name] // null) as $cl
    | (if $si.ads > 0 then ((.free_to_sell_amount // 0) / $si.ads) else null end) as $days
    | (if $cl != null then (($cl.prep_days // 0) + ($cl.delivery_days // 0)) else null end) as $hor
    | { sku: .sku, name: (.product_name // ""), warehouse: .warehouse_name,
        free_to_sell: (.free_to_sell_amount // 0),
        ads: $si.ads,
        days_of_stock: $days,
        horizon_days: $hor,
        at_risk: (if ($days != null and $hor != null) then ($days < $hor) else false end),
        profit_per_unit: $si.ppu,
        lost_profit: (if ((.free_to_sell_amount // 0) == 0 and $si.ads > 0 and $si.ppu != null) then ($si.ads * 7 * $si.ppu) else 0 end) }
  ] as $sw
| ([ $orders[] | select((.status // "") | ascii_downcase | test("cancel") | not) | (.analytics_data.city // "—") ]
    | group_by(.) | map({ city: .[0], orders: length }) | sort_by(-.orders)) as $demand
| {
    by_sku_warehouse: $sw,
    risk: ([ $sw[] | select(.at_risk) ] | sort_by(-.lost_profit)),
    top_lost: ([ $sw[] | select(.lost_profit > 0) ] | sort_by(-.lost_profit) | .[0:10]),
    demand_by_city: $demand,
    notes: (if ($orders | length) == 0 then ["За период заказов нет — упущенной прибыли нет, показаны текущие остатки"] else [] end)
  }
