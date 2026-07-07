# Шаблон карты lifecycle (структура Sheets «Lifecycle-кампании»)

## Лист map
| branch | goal | entry_condition | exit_condition | emails | status |
|---|---|---|---|---|---|
| welcome | 10% в покупку за 14 дней | подписка на лид-магнит | покупка / конец ветки / отписка | 4 | active |
| activation | 60% открыли продукт | покупка, нет активности 3 дня | активность / конец ветки | 3 | draft |
| winback | 5% вернулись | нет покупок 60 дней | покупка / конец ветки | 3 | planned |
| vip | удержание топ-клиентов | топ-10% по LTV | — (ежеквартально) | 1–2 | planned |

## Лист settings (строка = письмо)
branch | step | delay (от входа/прошлого письма) | subject_ref (ссылка на док) | goal письма | stop_conditions

## Лист metrics (пользователь кладёт выгрузку ESP)
date | branch | step | sent | opens | clicks | unsubs | purchases(если есть)

## Лист queue (только Gmail-режим)
email | name | branch | step | next_send_date | status (pending/sent/replied/stopped)

## Правила
Один контакт — одна активная ветка. Приоритет: welcome > activation > winback > vip. Праздничные/разовые кампании в map не входят — отдельным доком по команде.
