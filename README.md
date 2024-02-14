## File setup

1. Cash Register
2. Item
3. ItemDiscounts
4. Discount

# Cash Register

- Point of entrance from the CLI
- Adds items
- Calculates the total

# Item

- Holds item prices
- Returns the item prices

# ItemDiscounts

- Holds the item discounts setup - similar to a many-to-many relationship in a db

# Discounts

- Holds the rules of how discounts work
- Works more like a service/helper in this setup, and the rules would be stored in the DB probably, not in methods

## Process

1. The cash register requests to calculate the total sum
2. Items are counted
3. ItemDiscounts are pulled
4. We loop through the items and their itemdiscounts and apply the discounts
5. Return the final total
