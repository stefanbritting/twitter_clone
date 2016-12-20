class CreateUsersWithAssiciations < ActiveRecord::Migration
	def change
		create_table :users do |t|
			# id added automatically
			t.string :first_name
			t.string :last_name
			t.string :user_name, null: false
			t.string :email, null: false
			t.string :password, null: false
			t.timestamps null: false
		end

	end
end
