- view: test_dt_extended
  derived_table:
    sql: |
      SELECT * FROM ${sql_runner_query_1.SQL_TABLE_NAME}
    persist_for: 10 minutes
    indexes: [count, this_status]
    
  fields:
# #     Define your dimensions and measures here, like this:
    - filter: count
      type: number
      sql: ${TABLE}.count
      
      
    - filter: woo_status
      type: string  
      sql: ${TABLE}.this_status


