## Instacart Lite

### We'll build on our Rails app started during the [lecture](/lectures/rails/rails-intro.md)

So far we just have the Users model. What other models make sense to add to Instacart's customer-facing site? We can practice using Rails generate to create scaffolds of data models, views, and controllers (MVC). Below is a list of resources but feel free to add others. Furthermore let's work on connecting all of these resources to make a continuous website experience (ie. login > browse storefront > add to cart). Bonus: work on the sprucing up the UI.

### Submission
When ready, check-in the files for your Rails app in the `assignments-2019` repo under the `assignment-7-instacart-lite` folder: [https://github.com/carrot-u/assignments-2019](https://github.com/carrot-u/assignments-2019)


### Idess for Resources/Entities
Note: left in the bit about entity relationships. We'll go over this next week but feel free to disregard.

- Store
  - Attributes:
    - Name
    - Address
  - Relationships
    - has many products

- Products
  - Attributes:
    - Title
    - Description
    - Price
  - Relationships:
    - belongs to a store
    - belongs to a cart

- Carts
  - Relationships:
    - belongs to a user
    - has many products
  - Extra methods:
    - def total (this should return the total price of all items)

- Users
  - Attributes
    - first_name
    - last_name
  - Relationships:
    - has many carts
  - Extra methods:
    - def total_for_carts (return the total of all cart totals)
