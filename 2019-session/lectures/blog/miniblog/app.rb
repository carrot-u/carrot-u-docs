require 'sinatra'
require 'sequel'
require 'sqlite3'
require './models/post'

get '/' do
    "Hello world!"
end

get '/hello/:name' do
    @greetings = ["Hello", "Hi", "Salutations","Y"]
    @name = params['name']
    erb :hello
end

get '/write_post' do
    erb :write_post
end

post '/create_post' do
    new_post = Post.new(params[:title], params[:post_body])
    new_post_row = new_post.create!

    redirect "posts/#{new_post_row[:id]}"
end

get '/posts/:post_id' do
    @post = Post.find(params[:post_id])
    erb :post
end
