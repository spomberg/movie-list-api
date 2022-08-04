class ListController < ApplicationController
  require 'http'
  require 'nanoid'
  include ListHelper, UserHelper

  def index
    lists = List.where(:is_public => true).order_by([:created_on, :desc]).limit(10)

    output = get_list_index_info(lists)

    render json: output.to_json
  end

  def show
    if List.where(id: params[:id]).exists? 
      list = List.find(params[:id])
      if list.is_public || get_user_id == list.user_id
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
  
        render json: { status: "success", code: 200, list: output }
      else
        render json: { status: "error", code: 401, message: "Invalid credentials!" }
      end
    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def new
    if get_user_id

      new_list = {
        _id: Nanoid.generate(size: 8),
        title: params[:title],
        description: params[:desc],
        movies: [],
        is_public: params[:is_public] == nil ? false : params[:is_public],
        user_id: get_user_id,
        created_on: Time.now
      }
  
      List.create(new_list)
  
      render json: new_list.to_json
    else
      render json: { status: "error", message: "Please login to create a new list" }
    end
  end

  def edit
    if List.where(id: params[:id]).exists? 
      list = List.find(params[:id])

      if list["user_id"] == get_user_id
        if params["title"] != nil || params["description"] != nil || params["is_public"] != nil
          list["title"] = params["title"]
          list["description"] = params["desc"]
          list["is_public"] = params["is_public"]
        end
  
        if params["add_movie"] != nil
          add_movie(params["add_movie"].to_i, list)
        end
  
        if params["remove_movie"] != nil
          remove_movie(params["remove_movie"].to_i, list)
        end
  
        if params["move_up"] != nil
          move_up(list["movies"], params["move_up"].to_i)
        end
  
        if params["move_down"] != nil
          move_down(list["movies"], params["move_down"].to_i)
        end
  
        list.upsert
  
        render json: { status: "success", code: 200, list: list }
      else
        render json: { status: "error", code: 401, message: "Invalid credentials!" }
      end
    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def edit_view
    if List.where(id: params[:id]).exists? 
      list = List.find(params[:id])

      if get_user_id == list["user_id"]
        show
      else
        render json: { status: "error", code: 401, message: "Invalid credentials!" }
      end

    else
      render json: { status: "error", code: 404, message: "Can't find list" }
    end
  end

  def destroy
    if List.where(:id => params[:id]).exists?
      list = List.find(params[:id])
    end

    if !list
      render json: { status: "error", code: 404, message: "Can't find list!" }
    elsif list && get_user_id == list["user_id"]
      list.delete
      render json: { status: "success", code: 200, message: "List deleted successfully" }
    else
      render json: { status: "error", code: 401, message: "Invalid credentials!" }
    end

  end

  def search
    output = []
    search_param = params[:query].gsub(" ", "&20")
    search_results = (HTTP.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&query=#{search_param}")).parse

    search_results["results"].each do |result|
      if result["original_title"] != nil
        output.push(result)
      end
    end

    render json: output.to_json
  end

end
