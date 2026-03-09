# Data Contract Evolution

Open the [Data Contract Editor](https://editor.datacontract.com) for all steps below.

## Create v2

Use your `orders_v1.odcs.yaml` from [Exercise 1](exercise1-put-your-data-under-contract.md) as the starting point.

1. Introduce a new major version where the column `quantity` is added to the [`line_items`](/data/orders_v2/line_items.json) table. It defaults to 1, but is still a breaking change for data consumers.
   - Create a new file `orders_v2.odcs.yaml` based on your v1 contract
   - Update the ID to `..._v2`
   - Update the db-schema to [`..._v2`](/data/orders_v2/) (catalog: `sas2026`, schema: `orders_v2`)
   - Set `status` to `draft`
   - Add the `quantity` property to `line_items`
2. Run the tests and make sure they pass

## Plan the Migration

3. Think through the lifecycle of v1 and v2:
   - Set v1 status to `deprecated` and add an `endOfSupport` SLA property with a concrete date
   - Set v2 status to `active` once consumers have been notified
   - Eventually set v1 status to `retired`
   - Who needs to be informed? How would the `support` channels from exercise 1 help here?
