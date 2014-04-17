require 'rack/rewrite'
if ENV['RACK_ENV'] == 'production'
  Rails.application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, "http://#{ENV['HOST']}$&", if: Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != ENV['HOST']
    }
  end
end
