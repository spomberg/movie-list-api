module UserHelper
  def get_user_id
    if !request.headers["token"]
      false
    else
      decode_user_data(request.headers["token"])[0]["user_data"]
    end
  end
end
