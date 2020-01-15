# Let's Build A Web Application Using Sinatra... Together!

## What are we doing here?

We're going to build a web application using a Ruby microframework gem called Sinatra!

### What is a web application?

A web application is basically an application that runs in your browser. Gmail is a web application, Instacart is a web application. This often involves some parts on the client (code running in your local web browser) and some parts on a server (code running on a machine somewhere else).

### What is a micro web framework?

Sinatra describes itself as a DSL (domain specific language) for creating web applications. A micro web framework is another way of saying that it is a lightweight way to provide common functionality for web applications.

Sinatra is "micro" when compared to a more robust and feature rich framework like Ruby on Rails.

### Ok, but what is a gem?

'Gem' is the term for a Ruby library. This library is a piece of software that has a specific functionally. In the case of Sinatra, it is a library that contains code that helps us write web applications. A gem might rely on other gems.

## Let's Install Sinatra

*first lets make sure that you have a current version of Ruby*
```
ruby -v
# should be something like "ruby 2.3..."
```
if not check out the [Ruby InstallFest Docs](https://github.com/carrot-u/carrot-u-docs/blob/master/docs/install-fest/rbenv.md).

Now let's install the gem from RubyGems

```
gem install sinatra --no-ri --no-rdoc
```
(this downloads a bunch of code from a server at rubygems.org and copies it to your computer so you can use it in your programs)

The `--no-ri --no-rdoc` skips the install of some local docs, which slows down the install a bit.

To make sure your gem installed, let's check the version:
```
gem list --local sinatra
# should be something like "sinatra (2.0.8.1)"
```

## Now Let's Build Something With It!

We're starting a new project so create a new directory somewhere to house it. Let's call the directory `miniblog`

```
mkdir miniblog // make the miniblog directory
cd miniblog // and navigate into the new dir
```

*You should probably even do a `git init` as a matter of good practice.*

Create a new file called `app.rb`. This is where we will start building our web application. As we go along we'll break things out from this single file into multiple files in order to organize our code better.

We start with including the library (Sinatra) and defining a route.

```ruby
# in your app.rb
require 'sinatra'

get '/' do
  "Hello world!"
end
```

Now run the application:
```
ruby app.rb
```
And read the output to figure out how to view your new page in the browser.

Neat.

(we'll have to manually start and stop the Sinatra application to reload code for now.)

To manually stop the Sinatra application press `ctrl + c` *(note: not the actual "plus" key, just ctrl and the "c" key)*

**Why did we use the `get` route method?**

Now let's pass some data in and use it.  Add a new route that takes a url parameter:
```ruby
get '/hello/:name' do
  "Oh hi, #{params['name']}. Don't you look attractive today!"
end
```

Be sure to keep an eye on your terminal where Sinatra is running. You'll see output from the server for every request you make. This will also show you errors if you have them.

Now let's add some html to our page.

```ruby
get '/hello/:name' do
  "<h1>Greetings!</h1> Oh hi, <b>#{params['name']}</b>. Don't you look attractive today!"
end
```

Cool. But...

That's a crappy way to do html. The code is hard to read, it will be hard to update, and we're starting to do too much in these route handlers.

We can do better. Let's create a **view**. These will be files that represent the layout of our pages and will make use of any data we want to pass in.

create a new directory at the same level as `app.rb` called `views`. Your working directory should look like this:

```
> ls
app.rb   views
```

in `views` create a new file called `hello.erb` and move our messy code in there (but better formatted)

`What does .erb mean?`

"Embedded Ruby"

It's a templating system that allows us to run Ruby code in order to decide what should be displayed.

```
# in hello.erb
<h1>Greetings!</h1>

Oh hi, <b><%= #{?????} %></b>. Don't you look attractive today!
```

What's the deal with the `<%=` thing?

```erb
<%= THIS CODE WILL GET EXECUTED THEN DISPLAYED %>

<% THIS CODE WILL JUST GET EXECUTED %>
```

How do we tell our route to use this template?

```ruby
# in app.rb
get '/hello/:name' do
  erb :hello
end
```

So how do we get the name into here? (where the "????s" are)

```ruby
# in app.rb
get '/hello/:name' do
  @name = params['name']
  erb :hello
end
```

```erb
# in hello.erb
Oh hi, <b><%= @name %></b>. Don't you look attractive today!
```

Play around with this a bit! Try passing other things into your view. Try doing a loop in your view...

## Let's Build A Blog!

We should be able to:

- display posts
- write posts

In order to write a post we need to send data from the client (the page that you're viewing in your browser) to the server (the Sinatra web application) and then store that data somewhere (probably a database).

Let's start with sending data from the client to the server with a `POST` call.

*the "POST" here has nothing do to with the fact that we're making "blog posts". POST is a [REST](https://www.codecademy.com/articles/what-is-rest) verb (along with GET, PUTS, and DELETE). The POST verb is for creating things. The GET verb is for retrieving things.*

We'll start by making a new page with a form that we can use to submit some data. Let's create a route and a view:

```ruby
# in app.rb
get '/write_post' do
  erb :write_post
end
```
```
# create a write_post.erb file in /views

<h1>Write a Blog Post</h1>

<form action="/create_post" method="post">
  <div>
    <label for"title">title</label>
    <input type="text" id="title" name="title"></input>
  </div>
  <div>
    <label for="post_body">post body</label>
    <textarea id="post_body" name="post_body"></textarea>
  </div>
  <input type="submit" id="create_post">create post</input>
</form>
```

Go to the page (it's pretty ugly...). Try to create a post and see what happened.

What went wrong? How do we fix it? (hint: **read any error messages you were shown**)


Alright, let's create something to handle this request.

```ruby
# in app.rb
post '/create_post' do
  puts "*********** Trying to create new blog post ***********"
  puts "title: #{params[:title]}"
  puts "body: #{params[:post_body]}"
end
```

And now watch your console where your app is running.

Now let's actually save this to a database! We'll use Sqlite. It's a lightweight database that stores everything in a single file.

First confirm that you have Sqlite (you should, it comes installed with OSX)
```
> sqlite3 --version
# should look something like this: 3.24.0 2018-06-04 14:10:15 95fbac39baaab1c3a84fdfc82ccb7f42398b2e92f18a2a57bce1d4a713cbaapl
```

Let's set up our database. create a `/db` directory and then set up a Sqlite database called `app.db` there.
```
> mkdir db
> cd db
> sqlite3 app.db
# now you can run SQL commands to create tables
# let's create a posts table
sqlite> create table posts(id INTEGER PRIMARY KEY, title TEXT, body TEXT, created_at TEXT);
sqlite> .exit
```

Now we need to be able to work with our database from our program. To do this we're going to use a gem called **Sequel**.

https://github.com/jeremyevans/sequel

**How do you think we install Sequel?**


Yup, RubyGems.

We also need the `sqlite3` gem to work with Sqlite databases through the Sequel gem.

```
> gem install sequel --no-ri --no-rdoc
> gem install sqlite3 --no-ri --no-rdoc
```

Now let's use it!

```ruby
# add these in app.rb
require 'sequel'
require 'sqlite3'
...

post '/create_post' do
  ...
  DB = Sequel.connect('sqlite://db/app.db')
  posts = DB[:posts]
  posts.insert(title: params[:title], body: params[:post_body], created_at: Time.now)
  puts "wrote to db"
end
```

Let's test it!

Did we write something?

```
> sqlite3 db/app.db
sqlite3> SELECT * FROM posts;
```

And now we want the application to read from the database...

```
# create a new view post.erb

<h1><%= @title %></h1>
<b>created: </b><%= @nice_date %>
<br />
<p>
  <%= @post_body %>
</p>
```

and let's create a bad route solution...

```ruby
# in app.rb
get '/a_post' do
  DB = Sequel.connect('sqlite://db/app.db')
  posts = DB[:posts]
  a_post = posts.first
  @title = a_post[:title]
  @nice_date = a_post[:created_at]
  @post_body = a_post[:body]
  erb :post
end
```

**Why is this bad?**




Let's try again...

```ruby
# in app.rb
get '/posts/:post_id' do
  DB = Sequel.connect('sqlite://db/app.db')
  posts = DB[:posts]
  a_post = posts.first(id: params[:post_id])
  @title = a_post[:title]
  @nice_date = a_post[:created_at]
  @post_body = a_post[:body]
  erb :post
end

# and add this to create_post
post '/create_post' do
  ...
  new_post_id = posts.order(:created_at).last[:id]

  redirect "posts/#{new_post_id}"
end
```

Neat. Now we can navigate to any posts we create based on their id. Plus when we create a new post, it sends us straight to that post. Try it out.

## Let's Make Things Better

We can refactor some things here. One thing that stands out is how were handling "posts". There's a lot of code thrown around different routes that could be consolidated into a class.

*Note: The Sequel gem provides some functionality that could streamline this even more, but we're going to start by doing things our own way.*

Let's create a class for our code to use. We'll store it in a `models` directory because it will help us work work a model from the database.

```
# let's create a post model
> mkdir models
> touch models/post.rb
```
Now we want to be able to get to the code

```ruby
# in app.rb
...
require './models/post'
```

```ruby
# in post.rb
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
end
```

Now we can think about `Post` objects.

```ruby
post = Post.new("How To Make a New Post", "Just type: `Post.new('How To Create a New Post', 'Just do this...')``")
puts post.title
```

Let's replace some of our ugly route code with something that uses `Post` objects.

We'll start by adding a method to save a new post.

```ruby
class Post
...
  def create!
    POSTS_TABLE.insert(title: @title, body: @body, created_at: @created_at)
    new_post_row = posts.order(:created_at).last

    new_post_row
  end
end
```

Now we can change our `app.rb` route to look like this:

```ruby
post '/create_post' do
  new_post = Post.new(params[:title], params[:post_body])
  new_post_row = new_post.create!

  redirect "posts/#{new_post_row[:id]}"
end
```

Excellent.

Now let's do something similar with the post display page. This time we'll use a class method to find posts.

in our `post.rb` class...

```ruby
class Post
...
  def self.find(post_id)
    post_row = POSTS_TABLE.first(id: params[:post_id])
    Post.new(post_row[:title], post_row[:body], post_row[:created_at])
  end
end
```

And how we can change our post route to:

```ruby
get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end
```

And update our `post.erb` template to use the single `@post` object instance.

```
<h1><%= @post.title %></h1>
# and so on...
```

## Now We Have A Blog!

Kinda.

Obviously, we're missing quite a few features and it doesn't look very polished, but it works.

We can **write posts** and then **display those posts**.

What else should we add?
