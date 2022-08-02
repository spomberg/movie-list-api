class ApplicationController < ActionController::Base
  before_action :set_csrf_cookie
    include ActionController::Cookies
    include ActionController::RequestForgeryProtection
  
    protect_from_forgery with: :exception 
		
    def cookie 
        "ok"
    end
		
    private 
		
    def set_csrf_cookie
       cookies["CSRF-TOKEN"] = {
            value: form_authenticity_token,
            domain: :all 
        }
    end
end
