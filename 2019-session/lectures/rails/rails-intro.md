# Ruby on Rails


## Machine setup for Rails

### Check version
```
ruby --version
# should be something like "ruby 2.3..."
```
if not check out the [Ruby InstallFest Docs](../../install-fest/rbenv.md).


### Install Rails
Do we have it already?
```
rails --version
# should be something like "Rails 4.2..."
```

Otherwise let's get it installed
```
gem install rails --no-ri --no-rdoc
```

### Postgres

We should already have the Postgres DB setup from [Ruby InstallFest Docs](../../install-fest/postgres.md)

Install Postgres gem
```
gem install pg
```

#### Create a database user ("role") for our app

Start the Postgres.app
Double click on a database (maybe the one with your username on it) to open up psql
Run the `create role` command to setup the DB user:

```
# create role instacartlite with createdb login password 'password';
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
* Rails implementes this as _ActiveRecord-ActionController-ActionView_


## Building a new Rails app

### Make a new Rails app
```
rails new instacartlite --database=postgresql
```
That's it, our app is made. Well ok, there is a bit more to do.

#### Start the rails server

Open a new terminal tab for the server to run in
```
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
```
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
```
# SQL
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
Rails has generated all the components of Model-View-Controller for the Users model for us (see for yourself). Of course this is just a skelton that we need to fill in, but quite a bite is there. We can already run [http://localhost:3000/users](http://localhost:3000/user)


## Forward-looking statements
This is just the start of the topic of Rails applications. In the following weeks, we'll talk more about models in Rails in our discusion of _ActiveRecord_ as well as _testing_ which is an important part of the development lifecycle.
