- view: test_dt
  derived_table:
    sql: |
      SELECT * FROM orders
      WHERE {% condition this_status %} orders.status {% endcondition %}

    # persist_for: 10 minutes
    indexes: [count, status]

  fields:
  - dimension: count
    type: number
    sql: ${TABLE}.`COUNT(*)`
    
  - filter: this_status
    type: string
    suggestions: [Complete, Pending, Cancelled]