
- view: sql_runner_query
  derived_table:
    sql: |
      SELECT * FROM orders
    persist_for: 10 minutes

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: id
    type: number
    sql: ${TABLE}.id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: user_id
    type: number
    sql: ${TABLE}.user_id

  - dimension: order_amount
    type: number
    sql: ${TABLE}.order_amount

  - dimension_group: created_at
    type: time
    sql: ${TABLE}.created_at

  sets:
    detail:
      - id
      - status
      - user_id
      - order_amount
      - created_at_time

