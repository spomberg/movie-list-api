require 'http'

module ListHelper

  def is_movie_id_valid(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).parse

    if movie_details['original_title'] != nil
      return true
    end
    
    false
  
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

end