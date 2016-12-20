class CreateTweetsWithAssiciations < ActiveRecord::Migration
	def change
		create_table :tweets do |t|
			# id added automatically
			t.string :tweet
			t.belongs_to :user, index: true
			t.timestamps null: false
		end
	end
end
