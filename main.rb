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
