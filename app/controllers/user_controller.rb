class UserController < ApplicationController
  include ListHelper

  def show
    lists = List.where(:user_id => "0").order_by([:created_on, :desc])

    output = []
    
    lists.each do |list|
      output.push({
        id: list["_id"],
        title: list["title"],
        created_on: list["created_on"]
      })
    end
    
    output

    render json: output.to_json
  end
end
