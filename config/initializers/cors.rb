Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['ORIGIN']

    Rails.application.config.action_controller.forgery_protection_origin_check = false
    
    resource '*', 
      headers: :any, 
      methods: [:get, :post, :put, :delete],
      credentials: true
    end
end