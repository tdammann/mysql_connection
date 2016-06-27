- view: i_am_camel
  sql_table_name: looker_test.iAmCamel
  fields:

  - dimension: my_int
    type: number
    sql: ${TABLE}.my_int

  - measure: count
    type: count
    drill_fields: []

