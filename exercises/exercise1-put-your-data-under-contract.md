# Put your data under contract

1. Define a data contract for the data under [`orders-v1`](/data/orders-v1/) on postgres database
2. Add the two tables `orders` and `line_items`. And all the properties with logical types.
3. Run the tests in the Data Contract Editor, and fix the wrong types
4. Change physicalType in customerEmailAddress to integer, or remove a column, and run the tests again to see that they can fail as well
5. Make the following changes (but before you do this, make sure all tests run correctly!)
   - set version to "1.0.0"
   - set status to "active"
   - Add examples for customer email address based on `data/*.json` via `examples: [...]`
   - Make customer email address a required field `required: true` and test again
   - Add a SQL quality check to ensure that the customer email address is valid (`NOT LIKE '%@%'`) and test again
   - add more constraints (if time allows it)
       - for every order_id in line item, there must exist an order_id in the orders table
       - order_total must be greater than or equal to 0
       - think of additional own constraints or things you want to add

    Documentation: https://bitol-io.github.io/open-data-contract-standard/latest/#sql
    
    Reference for quality checks:
    
    ```
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

Bonus:

- Use the **export** command to create an HTML documentation of the data contract. 
```
datacontract export --format html orders-v1.odcs.yaml > orders-v1.odcs.html
```

- Export to SQL DDL [exports](https://cli.datacontract.com/#export)

```
datacontract export --format sql orders-v1.odcs.yaml
```
- Use the **catalog** command to create a data contract catalog.
   - Command: `datacontract catalog`
