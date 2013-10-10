require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-lab-posts',
                host: 'localhost'}

class Post < ActiveRecord::Base
end


# Post.create(url: "http://placekitten.com/490/700", name: "abby", caption: "cat cat cat")
# Post.create(url: "http://placekitten.com/400/850", name: "Abby", caption: "kittennnns")
# Post.create(url: "http://placekitten.com/460/850", name: "abby", caption: "meow")



get '/davechan' do
  @posts = Post.all
  binding.pry
  erb :post_index
end

get '/davechan' do
  @posts = Post.order("updated_at DESC")
  erb :post_index
end

post '/davechan/new' do
  new_post = Post.create(url: params[:url], caption: params[:caption], name: params[:name])
  redirect '/davechan/#{new_post.id}'
end

get '/davechan/:id' do
  @post = Post.find(params[:id])
  erb :post_show
end

get '/davechan/:id/edit' do
  @post = Post.find(params[:id])
  erb :post_edit
end

post '/davechan/:id/delete' do
  Post.delete(params[:id])
  redirect '/davechan'
end

post '/davechan/:id/update' do
  updated_post = Post.where(id: params[:id])
  updated_post.name = params[:name]
  updated_post.caption = params[:caption]
  updated_post.save
  redirect "/davechan/#{params[:id]}"
end