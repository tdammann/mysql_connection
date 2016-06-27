- view: give_me_space
  sql_table_name: looker_test.give me space
  fields:

  - dimension: my_int
    type: number
    sql: ${TABLE}.my_int

  - measure: count
    type: count
    drill_fields: []

