class Rack::Attack
  throttle('req/ip', :limit => 300, :period => 5.minutes) do |req|
    req.ip # unless req.path.start_with?('/assets')
  end
end 