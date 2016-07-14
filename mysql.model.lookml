- connection: mysql


- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: all_types

- explore: give_me_space

- explore: i_am_camel

- explore: order_items
  joins:
    - join: orders
      type: left_outer 
      sql_on: ${order_items.order_id} = ${orders.id}
      relationship: many_to_one

    - join: users
      type: left_outer 
      sql_on: ${orders.user_id} = ${users.id}
      relationship: many_to_one


- explore: orders
  joins:
    - join: users
      type: left_outer 
      sql_on: ${orders.user_id} = ${users.id}
      relationship: many_to_one


- explore: users

- explore: sql_runner_query

- explore: orders_base
  extension: required
  from: orders
  view: orders
  fields: [] # start with no fields for safety

- explore: orders_marketing
  extends: orders_base
  # fields: [orders.order_amount*]