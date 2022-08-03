module UserHelper
  def get_user_id
    decode_user_data(request.headers["token"])[0]["user_data"]
  end
end
