select
  Customers.id,
  Customers.name,
  Customers.email,
  min(Orders.created_at)                                AS first_order_at,
  count(Orders.id)                                      AS number_of_orders
  from analytics-engineers-club.coffee_shop.customers Customers
  left join analytics-engineers-club.coffee_shop.orders Orders
    on Customers.id = Orders.customer_id
  group by
    Customers.id,
    Customers.name,
    Customers.email
  order by
    first_order_at asc
  limit 5