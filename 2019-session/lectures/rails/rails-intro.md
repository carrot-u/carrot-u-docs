# Ruby on Rails


## Machine setup for Rails

### Check version
```ruby
ruby --version
# should be something like "ruby 2.3..."
```
if not check out the [Ruby InstallFest Docs](../../install-fest/rbenv.md).


### Install Rails
Do we have it already?
```ruby
rails --version
# should be something like "Rails 4.2..."
```

Otherwise let's get it installed
```
gem install rails --no-document
```

#### Rails setup issues?

We may need to clean out previously installed files

Uninstall Rails and Postgres Gems:
```
gem uninstall rails
gem uninstall pg
```

This website also proved helpful: [http://installrails.com/](http://installrails.com/)

### Postgres

We should already have the Postgres DB setup from [Ruby InstallFest Docs](../../install-fest/postgres.md)

Install Postgres gem
```
gem install pg --no-document
```

#### Postgres issues?

If Postgres is not installed, you can install it from Brew:
```
brew update
brew install postgresql
```

#### Create a database user ("role") for our app

Start the Postgres app
Double click on a database (maybe the one with your username on it) to open up psql
Run the `create role` command to setup the DB user:

```
create role instacartlite with createdb login password 'password';
```
_Remember these creds as we'll need them later on._

## Stuff we should talk about first

### Why learn Rails?
* Rails is a well-designed, mature, and featureful framework for web applications
* You can create working applications super fast!
* Instacart (and many others) uses it
* Uses Ruby (why we've been learning it all this time)

### Waxing philosophical

* *Convention over Configuration (CoC)*: provides default ways to do many things with best practices
* *Don’t Repeat Yourself (DRY)*: code in a single place
* *Principle of Least Surprise*
* *Fat models, skinny controllers*

### Model-View-Controller (MVC)
This is a common and well-accepted way to organize our code. It is an observation that user interfaces decompose into these groupings:
* *Model*: manages the data, models something in real life as data with properties, is the layer above the database
* *View*: what we actually see, renders a collection of data
* *Controller*: manages incoming requests, performs operations (CRUD) on model, and hands off to view
* Rails implements this as _ActiveRecord-ActionView-ActionController_


## Building a new Rails app

### Make a new Rails app
```
rails new instacartlite --database=postgresql
```
That's it, our app is made. Well ok, there is a bit more to do.

#### Start the rails server

Open a new terminal tab for the server to run in
```ruby
rails s # 's' is short for server
```

Then confirm on your browser that the server is running: [http://localhost:3000/](http://localhost:3000/)
Note: that unlike Sinatra, you won't have to restart your server in Rails to load new changes. Rails is smart enough to load them for you.

Cool, now lets build some stuff

#### Navigate to your new application
```
cd instacartlite
```

#### What Rails created for us

```
instacartlite$ ls
Gemfile            app/               config.ru          node_modules/      storage/           yarn.lock
Gemfile.lock       babel.config.js    db/                package.json       test/
README.md          bin/               lib/               postcss.config.js  tmp/
Rakefile           config/            log/               public/            vendor/
```

Notes about files/directories:
* *Gemfile:* list of libraries used by app
* *README.doc:* info we edit about app
* *Rakefile:* compiles our web app
* *app/:* where most of code goes, MVC
* *bin/:* files to run app
* *config.rb:* configuration rules
* *config/routes:* configure routes to proper controller
* *config/database.yml:* configure connection to our database
* *db:* database definition

#### Bundle
Install dependencies
```
bundle install
```

if you run into issues running things..
```
bundle exec
```
will execute with all dependencies

#### Generating our welcome controller

Use rails generate
```ruby
rails g controller welcome index # notes: g for generate followed by "controller" (what is being generated), "welcome" (controller name), "index" (action)
```

Update routes to point to it from root
```ruby
# add to config/routes.rb
root 'welcome#index'
```
Check [http://localhost:3000/](http://localhost:3000/)

Update the welcome page
```ruby
# add to app/views/welcome/index.html.erb

<div align="center">
  <h1 style="color: rgb(46, 137, 19)">🥕 Instacart <i>Lite</i></h1>
  <h3>Groceries delivered in as lite-le as 1 hour</h3>
</div>
```
Refresh [http://localhost:3000/](http://localhost:3000/)

#### Configure database.yml and create databases
We need to add the _instacartlite_ credentials we used when creating the role. Update *database.yml* with the following lines:
```
username: instacartlite
password: password
```
Then run the database setup task:
```
rake db:setup
```

### Generate scaffold for instacartlite users

Run generate scaffold
```
rails g scaffold User email:string first_name:string last_name:string
```
This sets up lots of things for us! A controller, route, model, views and.. a migration

#### What's a migration?
A migration is a database vendor-agnostic way to define atomic parts of a database schema in Ruby. Scaffold has generated a migration for creating a users table here: `db/migrate/<date>_create_users.rb` When we want to make changes to a table such as adding columns, we add another migration to accomplish this.

However, the migration file has only been created, it has not run. Therefore the table doesn't exist until migrations have been executed:
```
rake db:migrate
```
Will run all pending migrations.

We can confirm the table is now created in our database. Open a _psql_ terminal to the _instacartlite_development_ DB instance
```SQL
\d # lists tables
\d users 
                                          Table "public.users"
   Column   |              Type              | Collation | Nullable |              Default              
------------+--------------------------------+-----------+----------+-----------------------------------
 id         | bigint                         |           | not null | nextval('users_id_seq'::regclass)
 email      | character varying              |           |          | 
 first_name | character varying              |           |          | 
 last_name  | character varying              |           |          | 
 created_at | timestamp(6) without time zone |           | not null | 
 updated_at | timestamp(6) without time zone |           | not null | 
Indexes:
    "users_pkey" PRIMARY KEY, btree (id)
```
Note that `id` , `created_at`, and `updated_at` were implicitly created for us

#### Remember MVC?
Rails has generated all the components of Model-View-Controller for the Users model for us (see for yourself). Of course this is just a skelton that we need to fill in, but quite a bit is there. We can already run [http://localhost:3000/users](http://localhost:3000/users)

#### Connecting to the index page
Now we have a create user interface, we should link it to the index page

We'll want to link to the `Users` model to create a new user. To create a dynamically set link we use the `link_to` tag in our `index.html.erb` file.
```ruby
# add to welcome/index.html.erb
 <%= link_to 'Sign up', new_user_path %>
```

How did we know to use `new_user_path`? It's the prefix for the `Users` model to create a new user. We can look these up by running `rake routes`:
```
instacartlite$ rake routes
                               Prefix Verb   URI Pattern                                                                              Controller#Action
                                users GET    /users(.:format)                                                                         users#index
                                      POST   /users(.:format)                                                                         users#create
                             new_user GET    /users/new(.:format)                                                                     users#new
                            edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                                 user GET    /users/:id(.:format)                                                                     users#show
                                      PATCH  /users/:id(.:format)                                                                     users#update
                                      PUT    /users/:id(.:format)                                                                     users#update
                                      DELETE /users/:id(.:format)                                                                     users#destroy
                        welcome_index GET    /welcome/index(.:format)                                                                 welcome#index
                                 root GET    /                                                                                        welcome#index
```
We just append `_path`  to the prefix to get `new_user_path`

### Lets build a login

#### Adding a password field

Our User model from earlier was missing a _password_ field, we can add it now:
```
rails g migration add_password_to_users password:string
```

We'll need to run migrations again for the new column to be added:
```
rake db:migrate
```

Our model will be updated automatically but our controller and views will need this new field:
```ruby
# update in controllers/users_controller.rb
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password)  # add :password to the allowed params
    end
```
And we want to add a password when we render the form to create a new user:
```ruby
# add to views/users/_form.html.erb
  <div class="field">
    <%= form.label :password %>
    <%= form.text_field :password %>
  </div>
```
We should also update the other views but, meh.

Let's try it now, creating a user from the root page and we can verify the user was created in _Rails console_: `rails c`

#### Creating a controller to handle logins
Typically we want to create
```
rails g controller Sessions new
```

#### Adding login routes
```ruby
# add to config/routes.rb
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
```

#### Updating the sessions controller
```ruby
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]
    if user && user.password == password
      @message = 'Successful login!'
    else
      @message = 'Bad username/password. Bad!'
    end
    render :index
  end
```

#### Adding the login form
```ruby
# add to views/sessoins/new.html.erb

<h1>Login</h1>
<%= form_for(:session, url: login_path) do |form| %>
  <div class="field">
    <%= form.label :email %>
    <%= form.text_field :email %>
  </div>

  <div class="field">
    <%= form.label :password %>
    <%= form.text_field :password %>
  </div>

  <div class="actions">
    <%= form.submit "login" %>
  </div>
<% end %>
```

#### Login success/error page
Add a new view to provide feedback on the login
```ruby
# create a new file: views/sessions/index.html.erb
<%= @message %>
```

#### Add a login link to the main page
```ruby
# add to welcome/index.html.erb
<%= link_to 'Login', login_path %>
```

And now lets try logging in: [http://localhost:3000/](http://localhost:3000/)


## Forward-looking statements
This is just the start of the topic of Rails applications. In the following weeks, we'll talk more about models in Rails in our discusion of _ActiveRecord_ as well as _testing_ which is an important part of the development lifecycle.

Assignment: [Instacart Lite](../../assignments/assignment-7-instacart-lite.md)