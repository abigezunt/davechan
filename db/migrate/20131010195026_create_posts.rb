class CreatePosts < ActiveRecord::Migration
  def up
  	create_table :davechan do |t|
  		t.text :url, default: "http://placekitten.com/500/800"
  		t.text :caption, default: "so cute! omg!!"
  		t.text :name, default: "anonymous"
  		t.timestamps
  	end
  end

  def down
  	drop_table :davechan
  end
end


