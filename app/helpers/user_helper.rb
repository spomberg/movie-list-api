module UserHelper
  def get_user_id
    if !cookies[:user_id]
      false
    else
      cookies.encrypted[:user_id]
    end
  end
end
