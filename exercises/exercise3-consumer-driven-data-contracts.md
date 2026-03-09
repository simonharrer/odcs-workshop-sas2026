# Consumer-Driven Data Contracts

A consumer-driven data contract lets the *consumer* define what subset of data they need and what quality they expect. This enables the producer to understand actual usage and avoid breaking real consumers.

**Scenario:** The **controlling team** needs order totals for financial reporting. They don't care about line items or customer emails — they only need `order_id` and `order_total`, and they require every order total to be greater than 0.

Open the [Data Contract Editor](https://editor.datacontract.com) for all steps below.

## Create the Consumer Contract

1. Save your data contract from Exercise 2 as `orders_v2.odcs.yaml` locally (use the save button on the top right; use the hamburger menu to load files). Then copy it to `orders_v2.consumer_controlling.odcs.yaml` and open it in the editor. (data: [`orders_v2`](/data/orders_v2/))
2. The controlling team is only interested in `order_id` and `order_total` from the `orders` object. Remove the `line_items` object entirely and remove all other properties from `orders` except `order_id` and `order_total`.
3. The consumer requires orders to have an `order_total` greater than 0. Add this as a quality check.
4. Run the tests and make sure they pass

## Bonus

- Use the Data Contract CLI to generate an SQL view that does the projection from the provider-driven contract, so the consumer only works on their subset:
  ```
  datacontract export --format sql-query orders_v2.consumer_controlling.odcs.yaml
  ```
  Save the result to `consumer-view.sql`.
