require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-lab-posts',
                host: 'localhost'}

class Post < ActiveRecord::Base
end

get '/davechan' do
  @posts = Post.all.order("created_at desc")
  erb :post_index
end

get '/davechan' do
  @posts = @posts = Post.all.order("created_at desc").where(flagged?: false)
  erb :post_index
end

post '/davechan/new' do
  post_id = Post.create(url: params[:url], caption: params[:caption], name: params[:name])
  redirect '/davechan/#{post_id}'
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
  flagged_post = Post.where(:id => params[:id])
  flagged_post.flagged = true
  flagged_post.save
  redirect '/davechan'
end

post '/davechan/:id/update' do
  updated_post = Post.where(id: params[:id])
  updated_post.name = params[:name]
  updated_post.caption = params[:caption]
  updated_post.save
  redirect "/davechan/#{params[:id]}"
end