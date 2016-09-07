- explore: o1
  always_filter:
    o1.event_date: 2012-01

- view: o1
  derived_table:
    sql: |
      SELECT *
      FROM orders o
      WHERE
        {% condition filter_id %} o.user_id {% endcondition %}
        AND {% condition event_date %} o.created_at {% endcondition %}
        

  
  
  fields:
  - filter: filter_id
    type: number

  - filter: event_date
    type: date

  # return the row if the user bought anything during the filtered historical timeframe
  #  for example, show me orders in 2012 where the customer bought something during 2011
  - filter: user_bought_during
    type: date
    sql: |
      EXISTS ( 
        SELECT *
        FROM orders o
        WHERE o.user_id = {{_table}}.user_id
        AND {% condition %} o.created_at {% endcondition %}
      )

  - measure: count
    type: count
    
  - dimension: user_id
    type: number



# persistent extend of o1
- explore: persistent_o1

- view: persistent_o1
  derived_table:
    sql: |
      SELECT * FROM ${o1.SQL_TABLE_NAME} as o
      WHERE {% condition counttho %} ${o1.SQL_TABLE_NAME}.user_id {% endcondition %}
      
    persist_for: 10 minutes
    indexes: [user_id]


# other test

- explore: test_dt
  always_filter: 
    test_dt.this_status: "Complete"

- view: test_dt
  derived_table:
    sql: |
      SELECT * FROM orders
      WHERE {% condition this_status %} orders.status {% endcondition %}

    # persist_for: 10 minutes

  fields:
  - dimension: count
    type: number
    sql: ${TABLE}.`COUNT(*)`
    
  - filter: this_status
    type: string
    suggestions: [Complete, Pending, Cancelled]
    
      
- explore: test_dt_extended
    
- view: test_dt_extended
  derived_table:
    sql: |
      SELECT * FROM ${test_dt.SQL_TABLE_NAME} as testDt
    persist_for: 10 minutes
    indexes: [count]
      


