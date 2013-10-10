require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'

configure do |variable|
	CONN = PG.connect(dbname: 'blog', host: 'localhost')
end

def query(sql)
	CONN.exec(sql)
end

get '/davechan' do
  @posts = query("SELECT * FROM davechan ORDER BY date")
  erb :post_index
end

get '/davechan/:id' do
  @post = query("SELECT * FROM davechan WHERE id=#{params[:id]} LIMIT 1").first
  erb :post_show
end

get '/davechan/:id/edit' do
  @post = query("SELECT * FROM davechan WHERE id=#{params[:id]} LIMIT 1").first
  erb :post_edit
end

post '/davechan/:id/delete' do
  query("DELETE FROM davechan WHERE id=#{params[:id]}")
  redirect '/davechan'
end

post '/davechan/:id/update' do
  query ("UPDATE davechan SET caption='#{params[:id]}', name='#{params[:name]}' WHERE id = #{params[:id]}")
  redirect "/davechan/#{params[:id]}"
end