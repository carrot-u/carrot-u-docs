require 'sinatra'
# require 'sequel'
# require 'sqlite3'
require './models/post'

get '/' do
  "Hello world!"
end

get '/hello/:name' do
  @name = params[:name]
  erb :hello
end

get '/write_post' do
  erb :write_post
end

post '/create_post' do
  # puts "*********** Trying to create new blog post ***********"
  # puts "title: #{params[:title]}"
  # puts "body: #{params[:post_body]}"
  # DB = Sequel.connect('sqlite://db/app.db')
  # posts = DB[:posts]
  # posts.insert(title: params[:title], body: params[:post_body], created_at: Time.now)
  # puts "wrote to db"
  # new_post_id = posts.order(:created_at).last[:id]

  new_post = Post.new(params[:title], params[:post_body])
  puts new_post
  new_post_row = new_post.create!

  redirect "posts/#{new_post_row[:id]}"
end

# get '/a_post' do
#   DB = Sequel.connect('sqlite://db/app.db')
#   posts = DB[:posts]
#   a_post = posts.first
#   @title = a_post[:title]
#   @nice_date = a_post[:created_at]
#   @post_body = a_post[:body]
#   erb :post
# end

get '/posts/:post_id' do
  # DB = Sequel.connect('sqlite://db/app.db')
  # posts = DB[:posts]
  # a_post = posts.first(id: params[:post_id])
  # @title = a_post[:title]
  # @nice_date = a_post[:created_at]
  # @post_body = a_post[:body]

  @post = Post.find(params[:post_id])
  erb :post
end
