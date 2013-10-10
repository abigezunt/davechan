class CreatePosts < ActiveRecord::Migration
  def up
  	create_table :posts do |t|
  		t.text :url, default: "http://placekitten.com/500/800"
  		t.text :caption, default: "so cute! omg!!"
  		t.text :name, default: "anonymous"
  		t.boolean :flagged, default: false
  		t.timestamps
  	end
  end

  def down
  	drop_table :posts
  end
end


