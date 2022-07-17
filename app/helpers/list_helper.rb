require 'http'

module ListHelper

  def is_movie_id_valid(id)
    movie_details = (HTTP.get("https://api.themoviedb.org/3/movie/#{id}?api_key=#{ENV['TMDB_API_KEY']}&language=en-US")).parse

    if movie_details['original_title'] != nil
      return true
    end
    
    false
  
  end

end