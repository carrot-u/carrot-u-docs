# Debug - shell tools, pry, postman, dev tools

## Pre-requisites 

- install pry `gem install pry`

- install [postman](https://www.getpostman.com/)

- have Instacart Lite setup (rails-intro.md#building-a-new-rails-app)

- create simple sinatra site in `main.rb`

```
require 'sinatra'
require 'pry'

get '/' do
  s = 'hello' + ' world!'
  #binding.pry
  s
end

get '/frank-says' do
  'Put this in your pipe & smoke it!'
end

```


## curl
```
> curl localhost:4567


> curl -I localhost:4567

> curl -Ivs localhost:4567


> curl --trace-ascii - localhost:4567


>  curl -Ivs localhost:4567 | grep Length
```


## Pry
 [GitHub - pry/pry: An IRB alternative and runtime developer console](https://github.com/pry/pry)
 [enable for rails](https://github.com/rweng/pry-rails)
 
```
> ls. # https://gist.github.com/banister/c0fc686ef923c8b87715

> cd Pry 

> show-method Array#select
> show-doc try_activate

> next 

> step

> continue

> whereami

> show-source -l
```
Commands starting with '.' will issue shell commands: https://github.com/pry/pry#command-shell-integration

Opening files from Pry: https://github.com/pry/pry#edit-methods

## Postman

Go to https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop/related and launch it

```
 - get 
 - post
 - post json
```

## Dev tools
```
- general tab
- networking
- source 
- application data
```
