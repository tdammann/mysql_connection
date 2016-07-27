#- base_view: o1
#  always_filter:
#    o1.event_date: 2012-01

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
#  - filter: user_bought_during
##    type: date
#    sql: |
#      EXISTS ( 
#        SELECT *
#        FROM orders o
#        WHERE o.user_id = {{_table}}.user_id
#        AND {% condition %} o.created_at {% endcondition %}
#      )
#
#  - measure: count
#    type: count
 #   
 # - dimension: user_id
 #   type: number
#*/

# # You can specify the table name if it's different from the view name:
#   sql_table_name: my_schema_name.o1
#
#  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: id
#       type: number
#       sql: ${TABLE}.id
#
#     - dimension: created
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.created_at
#
#     - measure: count
#       type: count


# # Or, you could make this view a derived table, like this:
#   derived_table:
#     sql: |
#       SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#
#  fields:
# #     Define your dimensions and measures here, like this:
#     - dimension: lifetime_orders
#       type: number
#       sql: ${TABLE}.lifetime_orders
#
#     - dimension: most_recent_purchase
#       type: time
#       timeframes: [date, week, month, year]
#       sql: ${TABLE}.most_recent_purchase_at
#
#     - measure: total_lifetime_orders
#       type: sum
#       sql: ${lifetime_orders}
