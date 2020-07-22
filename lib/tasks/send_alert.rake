require 'json'
require './models/route.rb'

task :send_alert do
  Route.send_alerts(Time.now.strftime("%Y-%m-%d %H:%M"))
end
