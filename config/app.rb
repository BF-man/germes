class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.

  # config.key = "value"
  faye_url = "http://faye-shrouded.herokuapp.com/faye"
  config.faye_js_url = "#{faye_url}.js"
  config.faye_server_url = "#{faye_url}"
end
