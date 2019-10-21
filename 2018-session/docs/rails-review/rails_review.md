# Overview of What We Can Do With Rails

Rails is a very powerful tool for building web applications.

Let's look at what we know how to do with Rails and connect it with what we did in Sinatra.

## Controllers

### Sinatra 

`app.rb`

```ruby
...
get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

post '/create_post' do
  new_post = Post.new(params[:title], params[:post_body])
  new_post_row = new_post.create!

  redirect "posts/#{new_post_row[:id]}"
end
...
```

### Rails

(can be generated as part of `rails generate ...`)

`app/controllers/posts_controller.rb`

```ruby
class PostsController < ApplicationController
  ...
  # GET /posts/1
  def show
    @post = Post.find(params[:post_id])
  end

  # POST /posts
  def create
    @post = Post.new(question_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  ...
end
```

## Routes

### Sinatra

This is sort of combined with controllers in `app.rb`

```ruby
get '/posts/:post_id' do
...
post '/create_post' do
...
```

### Rails

`config/routes.rb`

```ruby
Rails.application.routes.draw do
...
  # shortcut to add :index, new, show, create, edit, update, destory routes: https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
  resources :posts

  resources :comments, only: [] do
    post :add_to_post
  end
```

## Views

We used ERB for templating in both Sinatra and Rails. HAML is another option, but in the next section of Carrot U we'll start discussing robust Javascript based applications that work with backend systems (which could be written using Rails, Sinatra, or any number of other tools) to build interfaces.

### Sinatra

`views/layout.erb`

The "site-wide" layout.

`views/post.erb`
```ruby
<h1><%= @post.title %></h1>
<b>created: </b><%= @post.created_at %>
<br />
<p>
  <%= @post.body %>
</p>
```

### Rails

Honestly, pretty similar. ERB is ERB

`app/views/layouts/application.html.erb`

The "site-wide" layout.

`app/views/posts/show.html.erb`

```ruby
# the same code from Sinatra should work`
```

**NOTE:** You can use an extension of `.html.erb` or just `.erb` for your views, both should work.

## Models / DB Interactions

### Sinatra

In Sinatra we combine the use of plain old Ruby classes with some the `sequel` database library to give us encapsulation of functionality and a clean way to interact with the database.

`modes/post.rb`

```ruby
require 'sequel'
require 'sqlite3'

class Post
  DB = Sequel.connect('sqlite://db/app.db')
  POSTS_TABLE = DB[:posts]

  attr_accessor :title, :body, :created_at

  def initialize(title, body, created_at = nil)
    @title = title
    @body = body
    @created_at = Time.now
    @created_at = created_at if created_at
  end

  def create!
    POSTS_TABLE.insert(title: @title, body: @body, created_at: @created_at)
    new_post_row = POSTS_TABLE.order(:created_at).last

    new_post_row
  end

  def self.find(post_id)
    post_row = POSTS_TABLE.first(id: post_id)
    Post.new(post_row[:title], post_row[:body], post_row[:created_at])
  end
end
```

### Rails

In Rails we use `ActiveRecord` as our ORM (Object Relational Mapper). This provides us database interaction functionality and some convienent out of the box methods on our classes.

This helps with things like validation and association.

**Note:** The model in Rails inherits from `ApplicationRecord`, which inherits from `ActiveRecord::Base`. This is a new convention in Rails 5.

`app/models/post.rb`

```ruby
class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
end
```

We get things like `find` and `create` out of the box from ActiveRecord.

```ruby
> Post.create(post_params)
> # new post created
> Post.find(1)
# find a post by id
```

## What Else Is Rails Doing For Me?

- helping with security by validating inputs (preventing things like [SQL injection](https://en.wikipedia.org/wiki/SQL_injection))
- managaging datbase state with migrations and `schema.rb`
- providing a console with the application loaded ( `rails c` )
- access to a rich library of [Rails-friendly gems](https://github.com/hothero/awesome-rails-gem)

## So What Can We Do With Rails Now?

- create a new application with basic conventions set up ( `rails new app_name` )
- use models to create business objects to represent the problem and persist data
- use routes and controllers to define endpoints for users to hit
- use views to display information
- validate input into your application with model validations
- write tests to confirm functionality and prevent regressions

