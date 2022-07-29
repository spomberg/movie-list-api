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
    if List.where(id: params[:id]).exists? 
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
    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def new
    new_list = {
      _id: Nanoid.generate(size: 8),
      title: params[:title],
      description: params[:desc],
      movies: [],
      is_public: params[:is_public] == nil ? false : params[:is_public],
      user_id: 0,
      created_on: Time.now
    }

    List.create(new_list)

    render json: new_list.to_json
  end

  def edit
    if List.where(id: params[:id]).exists? 
      list = List.find(params[:id])

      list["title"] = params["title"]
      list["description"] = params["desc"]
      list["is_public"] = params["is_public"]

      list.upsert

      render json: list.to_json
    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def destroy
    if List.where(id: params[:id]).exists? 
      list = List.find(params[:id])

      list.delete

      render json: { status: "success", code: 200, message: "List deleted successfully" }
    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def search
    output = []
    search_param = params[:query].gsub(" ", "&20")
    search_results = (HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{search_param}")).parse

    5.times do |index|
      if search_results["results"][index] != nil
        output.push(search_results["results"][index])
      end
    end

    render json: output.to_json
  end

end
