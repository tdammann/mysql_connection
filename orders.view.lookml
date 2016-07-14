- view: orders
  sql_table_name: looker_test.orders
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: order_amount
    type: number
    sql: ${TABLE}.order_amount

#  - dimension: status
#    type: string
#    sql: ${TABLE}.status

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: [users.name, users.id, order_items.count]

  sets:
    detail:
      - id
      - order_amount
      - user_id
      - created
