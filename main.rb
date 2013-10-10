require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-class-posts',
                host: 'localhost'}

class Post < ActiveRecord::Base
end

get '/' do
  @posts = Post.all
  binding.pry
  erb :post_index
end


# configure do |variable|
# 	CONN = PG.connect(dbname: 'blog', host: 'localhost')
# end

# def query(sql)
# 	CONN.exec(sql)
# end

# get '/davechan' do
#   @posts = query("SELECT * FROM davechan ORDER BY date DESC")
#   erb :post_index
# end

# post '/davechan/new' do
#   query("INSERT INTO davechan (url, caption, name) VALUES ('#{params[:url]}','#{params[:caption]}','#{params[:name]}')")
#   redirect '/davechan'
# end

# get '/davechan/:id' do
#   @post = query("SELECT * FROM davechan WHERE id=#{params[:id]} LIMIT 1").first
#   erb :post_show
# end

# get '/davechan/:id/edit' do
#   @post = query("SELECT * FROM davechan WHERE id=#{params[:id]} LIMIT 1").first
#   erb :post_edit
# end

# post '/davechan/:id/delete' do
#   query("DELETE FROM davechan WHERE id=#{params[:id]}")
#   redirect '/davechan'
# end

# post '/davechan/:id/update' do
#   query ("UPDATE davechan SET caption='#{params[:id]}', name='#{params[:name]}' WHERE id = #{params[:id]}")
#   redirect "/davechan/#{params[:id]}"
# end