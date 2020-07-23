require 'json'


task :send_alert => :environment do
  routes = Route.send_alerts(Time.now.strftime("%Y-%m-%d %H:%M"))
end
