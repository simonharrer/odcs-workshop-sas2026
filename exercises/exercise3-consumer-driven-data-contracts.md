# Consumer-Driven Data Contracts

A consumer-driven data contract lets the *consumer* define what subset of data they need and what quality they expect. This enables the producer to understand actual usage and avoid breaking real consumers.

Open the [Data Contract Editor](https://editor.datacontract.com) for all steps below.

## Create the Consumer Contract

1. Copy the provider-driven data contract `orders_v2.odcs.yaml` as a starting point to `orders_v2.consumer-controlling.odcs.yaml` (data: [`orders_v2`](/data/orders_v2/))
2. The consumer is only interested in `order_id` and `order_total`, not in `line_items`. Remove the unused object and unused properties.
3. The consumer requires orders to have an `order_total` greater than 0. Add this as a quality check.
4. Run the tests and make sure they pass

## Bonus

- Use the Data Contract CLI to generate an SQL view that does the projection from the provider-driven contract, so the consumer only works on their subset:
  ```
  datacontract export --format sql-query orders_v2.consumer-controlling.odcs.yaml
  ```
  Save the result to `consumer-view.sql`.
