Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['ORIGIN']
    resource '*', headers: :any, methods: [:get, :post, :put, :delete], credentials: true
  end
end