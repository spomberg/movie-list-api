class ListController < ApplicationController
  def index
    output = []

    lists = List.where('is_public = true')

    lists.each do |list|

      output.push({
        id: list["_id"],
        title: list["title"],
        username: User.find(list["user_id"])["username"]
      })
    end

    render json: output.to_json
  end
end
