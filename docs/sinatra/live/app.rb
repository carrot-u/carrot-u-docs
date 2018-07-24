require 'sinatra'
require './models/post'

get '/' do
  "Hello world!"
end

get '/hello/:name' do
  puts params
  @name = params[:name]
  @names = ["Dave", "Dan", "Logan"]
  erb :hello
end

get '/write_post' do
  erb :write_post
end

post '/create_post' do
  new_post = Post.new(params[:title], params[:post_body])
  new_post_db_row = new_post.create!
  new_post_id = new_post_db_row[:id]

  redirect "posts/#{new_post_id}"
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end 