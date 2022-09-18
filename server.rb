require 'sinatra'
require './model'

port = 1234
set :port , port
puts "Listening on port #{port}"


posts = [{title: "First Post", body: "content of first post"}]

def getBody (req)
    req.body.rewind
    return JSON.parse(req.body.read)
end


get '/' do
  return erb :index
end

get '/posts' do
    return posts.to_json
end

get '/posts/:id' do
    id = params["id"].to_i
    return posts[id].to_json
end

post '/posts' do
    body = getBody(request)
    new_post = {title: body["title"], body: body["body"]}
    title = body["title"]
    body = body["body"]
    posts.push(new_post)
    add_post(title, body)
    return new_post.to_json
end

put '/posts/:id' do
    id = params["id"].to_i
    body = getBody(request)
    posts[id][:title] = body["title"]
    posts[id][:body] = body["body"]
    return posts[id].to_json
end

delete '/posts/:id' do
    id = params["id"].to_i
    post = posts.delete_at(id)
    return post.to_json
end
