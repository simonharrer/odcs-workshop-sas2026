# Data Contract Evolution

Open the [Data Contract Editor](https://editor.datacontract.com) for all steps below.

## Create v2

Save your data contract from [Exercise 1](exercise1-put-your-data-under-contract.md) as `orders_v1.odcs.yaml` locally (use the save button on the top right; use the hamburger menu to load files). Then copy it to `orders_v2.odcs.yaml` and open it in the editor.

1. Introduce a new major version where the column `quantity` is added to the [`line_items`](/data/orders_v2/line_items.json) table. It defaults to 1, but is still a breaking change for data consumers — any downstream pipeline or report that relies on a fixed set of columns will need to be updated.
   - Update the ID to `..._v2`
   - Update the db-schema to [`..._v2`](/data/orders_v2/) (catalog: `sas2026`, schema: `orders_v2`)
   - Set `status` to `draft`
   - Add the `quantity` property to `line_items`
2. Run the tests and make sure they pass

## Plan the Migration

Form teams of two. One person is responsible for v1, the other for v2. Play through the migration process together:

3. Think through the lifecycle of v1 and v2:
   - The v1 owner: set status to `deprecated` and add an `endOfSupport` SLA property with a concrete date
   - The v2 owner: set status to `active` once consumers have been notified
   - The v1 owner: eventually set status to `retired`
   - Who needs to be informed? How would the `support` channels from exercise 1 help here?
