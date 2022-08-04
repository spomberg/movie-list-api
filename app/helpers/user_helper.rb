module UserHelper
  def get_user_id
    if !session[:user_id]
      false
    else
      session[:user_id][:value]
    end
  end
end
