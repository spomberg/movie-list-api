class ListController < ApplicationController
  require 'http'
  include ListHelper

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

  def show
    list = List.find(params[:id])
    movies = []
    list["movies"].each do |movie|
      movies.push(extract_movie_info(movie))
    end

    output = {
      id: list["_id"],
      title: list["title"],
      username: User.find(list["user_id"])["username"],
      created_on: list["created_on"],
      description: list["description"],
      is_public: list["is_public"],
      movies: movies
    }

    render json: output.to_json
  end
end
