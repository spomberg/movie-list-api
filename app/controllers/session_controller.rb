class SessionController < ApplicationController
  require 'nanoid' 
  require 'bcrypt'
  include UserHelper
  
  def signup

    if User.where(email: params[:email]).exists? || User.where(username: params[:username]).exists?
      render json: { message: "This email or username has already been taken!" }
    else

      user = User.new(_id: Nanoid.generate(size: 8), 
              username:params[:username], 
              email: params[:email], 
              password_hash: BCrypt::Password.create(params[:password]))

      # if user is saved
      if user.save
        # return to user
        cookies.encrypted[:user_id] = { value: user['_id'], expires: 7.days }
      else
        # render error message
        render json: { message: "Invalid credentials" }
      end
    end
  end

  def login
    if User.where(:email => params[:email]).exists?
      user = User.find_by(:email => params[:email])
  
      if user && BCrypt::Password.new(user["password_hash"]) == params[:password]
        cookies.encrypted[:user_id] = { value: user['_id'], expires: 7.days }
      else
        render json: { message: "Invalid credentials!" }
      end
    else
      render json: { message: "Invalid credentials!" }
    end 
  end

  def logout
    cookies.delete :user_id
  end

end
