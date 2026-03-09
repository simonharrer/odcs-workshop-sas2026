# Consumer-driven Data Contracts

1. Copy the provider-driven data contract “orders-v2.odcs.yaml” as a starting point for the consumer-driven on to “orders-v2.consumer-controlling.odcs.yaml” (data: [`orders-v2`](/data/orders-v2/))
2. Consumer is only interested in order_id and order_total, not in line_items. Remove unused schema and unused properties
3. Consumer requires orders to have an order_total of more than 0. Add the additional quality check.
4. Make sure your consumer-driven data contract works and run the tests

Bonus: 

- Use the data contract CLI to define an SQL view in “consumer-view.sql” that does the projection from the provider-driven contract, so you are sure to only work on that subset using export to SQL Query. Use `datacontract export --format sql-query` as a helper.
