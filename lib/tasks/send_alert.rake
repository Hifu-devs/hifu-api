require 'json'

task :send_alert => :environment do
  Route.send_alerts(Time.now.strftime("%Y-%m-%d %H:%M"))
end
