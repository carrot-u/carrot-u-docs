# Debug - shell tools, pry, postman, dev tools

## Prereqquesites 

- install pry `gem install pry`

- install [postman](https://www.getpostman.com/)

- install telnet `brew install telnet`


Simple Sinatra site

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

## telnet
```
> telnet
o localhost 4567
GET: / HTTP/1.0
Host: localhost 


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
```
> ls. # https://gist.github.com/banister/c0fc686ef923c8b87715

> cd Pry 

> show-method Array#select
> show-doc try_activate

> next 

> step

> continue

```


## Postman
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
