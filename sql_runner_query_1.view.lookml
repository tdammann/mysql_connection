
- view: sql_runner_query_1
  derived_table:
    sql: |
      SELECT COUNT(*) FROM looker_test.iAmCamel

  fields:
  - dimension: count
    type: number
    sql: ${TABLE}.`COUNT(*)`

  sets:
    detail:
      - count

