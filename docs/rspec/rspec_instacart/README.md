# Rails Testing with Rspec and FactoryBot

## Testing Overview

### Why test?
+ Helps you develop behaviors in your app
  * What is the main function of this class?
  * What attributes must be validated on this model?
+ Protect against regressive issues when making small code changes, refactoring, or removing large chunks of supposedly "dead" code.

### TDD v BDD
Test-driven development focuses on the developer’s opinion on how parts of the software should work. Behavior-driven development focuses on the users’ opinion on how they want your application to behave.


### What is Rspec?
RSpec is a Behaviour-Driven Development tool for Ruby programmers.

In our test app, it replaces the default test suite.

### How Does it Work at Instacart?
It's expected that when you create/update a new model, controller, view, you'll add to or modify the corresponding spec files to accommodate your changes.

When you prepare to merge a change into production through git hub, we use a third party vendor called Circle CI that runs every existing spec on your "new" version of the app.

This ensures that new code doesn't break other code that is seemingly unrelated to your change.


### What is FactoryBot?
In order for tests to run, they need actual data.

FactoryBot is a gem to allows you to create templates for the various models in your app.

Rather than writing out the code to create or build a new instance of a model for every spec, you can easily call that template in your spec code.

For models with a lot of required attributes, this is a huge time saver.

It also provides consistency in what each spec file is testing.


## Writing Tests
If good Ruby reads almost like English, then spec files are practically prose.

It uses keywords like `describe` and `context` to create testing blocks for various conditions, and employs method chains like `is_expected.to be true` and `expect(order.customer_id).to_not be nil`

### Keywords
#### Describe
Creates a block for the entire class test or a large group, such as validations

```ruby
describe Order do
  # all of your tests
end
```

#### Let
Allows you specify what data is needed for the tests to run and assign a variable to each object

```ruby
let(:customer) { create :customer }
let(:driver) { create :driver }
# because the order model references customer/driver, we need those records to exist, and can call the full object in the next line
let(:order) { create :order, customer: customer, driver: driver }
```

*Pro-Tip* `let` uses lazy evaluation, meaning the test will only create the data when it's called in the test. If you need it to exist before (if another model is depending on it's existence) use `let!`


#### Context
Creates a block for tests with a specific condition

```ruby
context "when the order has items" do
  # test for something when your order has orders
end
```

#### Subject and It
`subject` defines the method or object that is being tested

```ruby
subject { order.mark_as_delivered }
```

`it` references the predefined subject in a test block

```ruby
it "updates the workflow state to delivered" do
  expect(order.workflow_state).to_eq "delivered"
  end
```

## Running tests
+ In a terminal (not console) window in your app's directory, run `rspec` to run all tests.
+ To run a single spec, run `rspec <file_path>`.

### When a spec passes
You get a green light, literally.

### When a spec fails
The output changes to red and it'll give you what line the spec failed and why.

### Best Practices
+ Each test should make only one assertion. Decoupling expected behavior creates more transparency in your tests and will make future debugging much easier.
+ Test for edge cases. Often we test from a boolean standpoint and forget about what can live outside this polarity (this is also a good way to highlight areas for potential refactor in your code).
+ If a test fails and it's not due to a syntax error or missing object, don't change the test the force a pass. Check your code for possible errors.

[Better Specs](http://www.betterspecs.org/) is a great resource for immediately learning good practices.

# TODO
- [ ] how to install
- [ ] finish all specs
- [ ] create assignment
- [ ] create class tasks

### Model Study: Order

### Feature Study: Order Controller/View

### Driver Model/View

## How to Create a New App with rSpec

## Resources

+ [Rspec Docs](http://rspec.info/)
+ [Relish: MOAR Rspec Docs](https://relishapp.com/rspec)
+ [Better Specs](http://www.betterspecs.org/)
+ [Behavior Driven Development: It’s Test Driven Development Done Right](https://blog.codeship.com/behavior-driven-development/)
+ [Setting Up Factory Bot](https://www.rubydoc.info/gems/factory_bot/file/GETTING_STARTED.md)
+ [Your Guide to Testing in Ruby on Rails 5](https://hackernoon.com/your-guide-to-testing-in-ruby-on-rails-5-c8bd122e38ad)
+ [Ruby on Rails 5 - BDD, RSpec and Capybara](https://www.udemy.com/ruby-rails-5-bdd-rspec-capybara/?start=0)
+ [Set up Rspec and FactoryBot](https://medium.com/@lukepierotti/setting-up-rspec-and-factory-bot-3bb2153fb909)
