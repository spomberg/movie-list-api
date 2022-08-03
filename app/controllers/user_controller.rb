class UserController < ApplicationController
  include ListHelper, UserHelper

  def show
    if authentication

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
