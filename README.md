## Description

A simple cash register that allows a user to add items and show a total amount, that is influenced by various discounts

## Usage

# Commands

- ruby cash_register.rb -> for running the cash register
- bundle exec rspec -> for running the tests

# Options

1. Add item(s)
2. Request to see a total
3. Quit once the process is done

## File setup / Architecture

\*. Gems 0. Some of the choices made

1. Cash Register
2. Item
3. ItemDiscounts
4. Discount

# Gems Selected

- pry for debugging
- rspec for testing. Was chosen over minitest due to more personal experience with it and the flexibility aspect

# Choices made

- In order to separate the logic properly and allow for further flexibility i've split it with the following context in mind
  - cash_register - would act like a AppController (in Rails) where the user has all the interactions, data is processed and then sent back to the user
  - item - similar to a model, it only holds the prices, but in case other attributes would need to be stored, they would be stored here
  - discount - similar to a model, it would hold the types of discounts, in this case it also acts a bit like helper/service that helps with the processing of discounts as well
  - item_discount - similar to a model in a many-to-many relationship, it connects the items to the discounts, and also keeps track of the particularities of each type of item-to-discount

# Cash Register

- Point of entrance from the CLI
- Adds items
- Calculates the total
- Quits from the process
- Designed in mind with the purpose of being like an AppController in Rails, where there is little interaction

# Item

- Holds item prices
- Returns the item prices

# ItemDiscounts

- Holds the item discounts setup - similar to a many-to-many relationship in a db

# Discounts

- Holds the rules of how discounts work
- Works more like a service/helper in this setup, and the 'rules' would be stored in the DB

## Process

1. The cash register requests to calculate the total sum
2. Items are counted
3. ItemDiscounts are pulled
4. We loop through the items and their itemdiscounts and apply the discounts
5. Return the final total

## Testing approach

1. I had an initial suite of tests (based on the amenitiz examples)
2. Built enough of the code base to have a working prototype
3. Added extra tests
4. Refactored
5. Cleaned up some of the extra tests
6. Followed on the principle of not having tests for private methods
