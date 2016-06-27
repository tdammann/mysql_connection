- view: order_items
  sql_table_name: looker_test.order_items
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount
    type: number
    sql: ${TABLE}.amount

  - dimension: order_id
    type: number
    # hidden: true
    sql: ${TABLE}.order_id

  - dimension: sku_num
    type: number
    sql: ${TABLE}.sku_num

  - measure: count
    type: count
    drill_fields: [id, orders.id]

