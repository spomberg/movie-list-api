require 'http'

module ListHelper

  def is_movie_id_valid(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).parse

    if movie_details['original_title'] != nil
      return true
    end
    
    false
  
  end

  def extract_movie_info(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).parse
    
    return {
      original_title: movie_details['original_title'],
      overview: movie_details['overview'],
      poster_path: "https://image.tmdb.org/t/p/original#{movie_details['poster_path']}",
      release_date: movie_details['release_date'],
      runtime: movie_details['runtime']
    }
  end

end