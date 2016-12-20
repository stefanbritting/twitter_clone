class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  has_many :tweets
  has_many :following, :foreign_key => 'follower_id',
                      :class_name => 'Follower',
                      :dependent => :destroy
  has_many :follower, :foreign_key => 'followed_id',
                      :class_name => 'Follower',
                      :dependent => :destroy
    # Bcrypt password security with salted hash
  has_secure_password

    # update user information
    # update required information
    # if the passed value is not ""(=field is empty)
  def update!(params) # as hash
    self.first_name = params[:first_name] if params[:first_name] != ""
    self.last_name  = params[:last_name] if params[:last_name] != ""
    self.user_name  = params[:user_name] if params[:user_name] != ""
    self.email      = params[:email] if params[:email] != ""
    self.save
  end
  # end of class
end
