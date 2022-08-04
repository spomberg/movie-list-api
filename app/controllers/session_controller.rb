class SessionController < ApplicationController
  require 'nanoid'
  
  def signup

    if User.where(email: params[:email]).exists? || User.where(username: params[:username]).exists?
      render json: { message: "This email or username has already been taken!" }
    else

      user = User.new(_id: Nanoid.generate(size: 8), username:params[:username], email: params[:email], password: params[:password])

      # if user is saved
      if user.save
        # return to user
        session[:user_id] = { value: user['_id'], expires: 7.days }
      else
        # render error message
        render json: { message: "Invalid credentials" }
      end
    end
  end

  def login
    user = User.find_by(:email => params[:email])

    # you can use bcrypt to password authentication
    if user && user["password"] == params[:password]
      # return to user
      session[:user_id] = { value: user['_id'], expires: 7.days }
    else
      render json: { message: "Invalid credentials" }
    end
  end

end
