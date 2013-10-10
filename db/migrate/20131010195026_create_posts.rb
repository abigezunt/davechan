class CreatePosts < ActiveRecord::Migration
  def up
  	create_table :davechan do |t|
  		t.string :url ||='http://placekitten.com/500/800'
  		t.text :caption ||='so cute! omg!!'
  		t.text :name ||='anonymous'
  		t.timestamps
  end

  def down
  end
end


