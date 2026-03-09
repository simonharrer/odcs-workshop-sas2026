# Data Contract Evolution

1. Introduce a new major version where the column “quantity” is introduced in the [`line_items`](/data/orders-v2/line_items.json) table. It defaults to 1, but is still a breaking change for the data consumers.
  - New file `...-v2`
  - New ID `...-v2`
  - New db-schema [`...-v2`](/data/orders-v2/)
  - Set status to `draft`
  - Add property `quantity`
2. Run the tests
3. Play the migration path in your head
  - deprecate v1
  - phase in v2
  - retire v1
