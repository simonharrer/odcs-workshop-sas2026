# Put Your Data Under Contract

You are the owner of the **orders** data in your company's e-commerce platform. The data consists of two tables: `orders` (containing order details like timestamps, totals, and customer information) and `line_items` (containing the individual items in each order, linked by `order_id`). Your goal is to define a data contract so that consumers of your data know exactly what to expect.

Open the [Data Contract Editor](https://editor.datacontract.com) for all steps below.

## Getting Started

1. Go to [editor.datacontract.com](https://editor.datacontract.com) and create a new data contract. Use the **Form** editor to get started.
   - Set the contract name to `Orders`, ID to `orders_v1`, version to `1.0.0`, and status to `draft`
2. Set up the server connection: type `databricks`, catalog `sas2026`, schema `orders_v1`
3. Look at the data under [`orders_v1`](/data/orders_v1/) and add the two schemas `orders` and `line_items` with all their properties and logical types.

   > **Hint:** Each property needs a `logicalType` (the abstract type like `string`, `integer`, `timestamp`) and a `physicalType` (the actual database type like `string`, `bigint`, `timestamp`). Here are the columns you should find:
   >
   > | Schema | Property | physicalType |
   > |--------|----------|--------------|
   > | `orders` | `order_id` | `string` |
   > | `orders` | `order_timestamp` | `timestamp` |
   > | `orders` | `order_total` | `bigint` |
   > | `orders` | `customer_id` | `string` |
   > | `orders` | `customer_email_address` | `string` |
   > | `line_items` | `lines_item_id` | `string` |
   > | `line_items` | `order_id` | `string` |
   > | `line_items` | `sku` | `string` |

4. Run the tests, and fix any wrong types
5. Verify tests can also fail: change `physicalType` of `customer_email_address` to `integer` (or remove a column), then run the tests again. Revert afterwards.

## Enrich the Contract

Make sure all tests pass before continuing, then:

6. Add a `description` with `purpose` (e.g., "Order data for analytics and reporting") and `limitations`
7. Add `tags`, e.g., `['orders', 'ecommerce']`
8. Mark `customer_email_address` with `classification: confidential` (it's PII)
9. Add `examples` for `customer_email_address` based on the JSON data files, e.g., `examples: ['test394@example.org']`
10. Make `customer_email_address` a required field: `required: true` — run the tests again

## Define Relationships

11. Add a `relationship` from `line_items.order_id` to `orders.order_id` to express the foreign key

    ```yaml
    relationships:
      - type: foreignKey
        to: orders.order_id
    ```

## Add Quality Checks

12. Add a SQL quality check to ensure that `customer_email_address` contains an `@` sign (find invalid rows):

    ```yaml
    quality:
      - type: sql
        description: Ensure email addresses are valid
        query: SELECT COUNT(*) FROM orders_v1.orders WHERE customer_email_address NOT LIKE '%@%';
        mustBe: 0
    ```

13. Add more constraints (if time allows):
    - Every `order_id` in `line_items` must exist in `orders`
    - `order_total` must be greater than or equal to 0
    - Think of your own additional constraints

    Reference for quality checks:

    ```yaml
    properties:
      - name: field
        quality:
          - type: text
            description: Ensure that ...
          - type: sql
            description: Ensure that ...
            query: SELECT COUNT(*) FROM ... WHERE ...;
            mustBe: 0
            # mustBeGreaterThan: 0
    ```

    Documentation: https://bitol-io.github.io/open-data-contract-standard/latest/#sql

## Add Ownership

14. Add a `team` and `support` channel:

    ```yaml
    team:
      name: Order Data Team
      members:
        - username: owner@example.com
          role: Owner

    support:
      - channel: "#order-data-help"
        tool: slack
    ```

## Add SLA Properties

15. Define service-level expectations:

    ```yaml
    slaProperties:
      - property: retention
        value: 1
        unit: y
        description: Order data retained for 1 year
      - property: frequency
        value: 1
        unit: d
        description: Data updated daily
    ```

## Publish

16. Your contract is complete — set `status` to `active` to publish it!

## Bonus

- Use the **export** command to create an HTML documentation of the data contract:
  ```
  datacontract export --format html orders_v1.odcs.yaml > orders_v1.odcs.html
  ```
- Export to SQL DDL ([exports](https://cli.datacontract.com/#export)):
  ```
  datacontract export --format sql orders_v1.odcs.yaml
  ```
- Use the **catalog** command to create a data contract catalog:
  ```
  datacontract catalog
  ```
