class CreateFollwersWithAssociations < ActiveRecord::Migration
	def change
		create_table :followers do |t|
			t.integer :follower_id, index: true # user who follows
			t.integer :followed_id, null: false # user who is being followed
			t.timestamps null: false
		end
	end
end
