class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  SECRET = ENV['SECRET_KEY']

  def authentication
    if request.headers["token"]
      # making a request to a secure route, token must be included in the headers
      decode_data = decode_user_data(request.headers["token"])
      # getting user id from a nested JSON in an array.
      user_data = decode_data[0]["user_data"] unless !decode_data
      # find a user in the database to be sure token is for a real user
      user = User.find_by(:_id => user_data) unless !user_data 
  
      # The barebone of this is to return true or false, as a middleware
      # its main purpose is to grant access or return an error to the user
    end

    if user
      return true
    else
      return false
    end
  end

  # turn user data (payload) to an encrypted string  [ A ]
  def encode_user_data(payload)
    token = JWT.encode payload, SECRET, "HS256"
    return token
  end

  # turn user data (payload) to an encrypted string  [ B ]
  def encode_user_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
  def decode_user_data(token)
    begin
      data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
      return data
    rescue => e
      puts e
    end
  end

  # decode token and return user info, this returns an array, [payload and algorithms] [ B ]
  def decode_user_data(token)
    begin
      JWT.decode token, SECRET, true, { algorithm: "HS256" }
    rescue => e
      puts e
    end
  end

end
