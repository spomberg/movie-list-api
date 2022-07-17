class ListController < ApplicationController
  def index
    output = []

    lists = List.where('is_public = true').order_by([:created_on, :desc])

    lists.each do |list|

      output.push({
        id: list["_id"],
        title: list["title"],
        username: User.find(list["user_id"])["username"],
        created_on: list["created_on"]
      })
    end

    render json: output.to_json
  end
end
