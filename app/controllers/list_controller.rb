class ListController < ApplicationController
  require 'http'
  require 'nanoid'
  include ListHelper

  def index
    lists = List.where(:is_public => true).order_by([:created_on, :desc]).limit(-10)

    output = get_list_index_info(lists)

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

  def new
    new_list = {
      _id: Nanoid.generate(size: 8),
      title: params[:title],
      description: params[:desc],
      movies: [],
      is_public: params[:is_public],
      user_id: 0,
      created_on: Time.now
    }

    List.create(new_list)
  end

end
