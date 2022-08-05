class UserController < ApplicationController
  include ListHelper, UserHelper

  def authenticate
    if get_user_id
      user = User.find(get_user_id)

      render json: { code: 200, username: user["username"] }
    else 
      render json: { code: 401, message: "Not authorized" }
    end
  end

  def view_lists
    if get_user_id

      user_id = get_user_id

      lists = List.where(:user_id => user_id).order_by([:created_on, :desc])
  
      output = []
      
      lists.each do |list|
        output.push({
          id: list["_id"],
          title: list["title"],
          created_on: list["created_on"]
        })
      end
      
      output
  
      render json: { code: 200, list: output }
    else
      render json: { message: "Invalid credentials!" }
    end

  end
end
