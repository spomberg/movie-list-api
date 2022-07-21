require 'http'

module ListHelper

  def is_movie_id_valid(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).parse

    if movie_details['original_title'] != nil
      return true
    end
    
    false
  
  end

  def get_list_index_info(lists)
    output = []
    
    lists.each do |list|
      output.push({
        id: list["_id"],
        title: list["title"],
        username: User.find(list["user_id"])["username"],
        created_on: list["created_on"]
      })
    end
    
    output
  end

  def get_directors(movie)
    output = []
    
    movie["credits"]["crew"].each do |crew_member|
      if crew_member["job"] == "Director"
        output.push(crew_member["name"])
      end
    end
    
    output
  end

  def get_cast(movie)
    output = []

    5.times do |index|
      if movie["credits"]["cast"][index] != nil
        output.push(movie["credits"]["cast"][index]["name"])
      end
    end

    output
  end

  def extract_movie_info(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&&append_to_response=credits")).parse
    
    return {
      id: movie_details['id'],
      original_title: movie_details['original_title'],
      overview: movie_details['overview'],
      poster_path: "https://image.tmdb.org/t/p/original#{movie_details['poster_path']}",
      release_date: movie_details['release_date'],
      runtime: movie_details['runtime'],
      directed_by: get_directors(movie_details),
      cast: get_cast(movie_details)
    }
  end

  def add_movie(id, list)
    unless list["movies"].include?(id) or !is_movie_id_valid(id)
      list["movies"].push(id)
    end
  end

end