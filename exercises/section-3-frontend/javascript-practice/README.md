# Javascript Exercises

## Goal
The purpose of these exercises is to provide students with practice using javascript
syntax and ES6 functions. Additionally, students can see an example of TTD development
by having test available before writing any code.

## Instructions
1. Make sure you have cloned the `carrot-u-docs` repo and the `cd` to the `carrot-u-docs/exercises/section-3-frontend/javascript-practice/` directory.
2. Start by running `npm install`.
3. Enter the command `yarn test:watch` into the terminal. This will launch the
javascript testing suite that is setup to compare solutions in `solutions.js`
against student answers in `startHere.js`. **All the test will be failing to start.**
4. Open `startHere.js`. You will see comments and empty functions. Your task
will be to fill in the functions to answer the problems in the comments. This
makes use of the data in `data.js`.
5. Open `data.js` and familiarize yourself with the data. This based on instacart
orders and warehouses data structures (FYI - order data and warehouse names are made up,
so you won't be able to recreate in blazer or find in an admin page).
6. Start completing the problems by filling in the functions (i.e. problem1, problem2...).
You should start to see tests go from failing (red) to passing (green) as you
complete the problems.

## Problems
1. Filter the list of warehouses created prior to November 2013
2. Give us an array of all warehouses with their name and created date
Each value should be in the following format: "Example, launched: YYYY/MM/DD"
**Hint:** date will need adjustment to match the format
3. Sort the warehouses by created_at, oldest to newest
4. What's the order total for all orders
5. Sort the warehouses by days between created and launch_date
6. create a list of warehouses with the 'Organic' category
7. Sort the order by user alphabetically by last name
8. Create a hash for counts of each first name
**Hint:** out put should be in this format: {"name":1,"name2":4}



