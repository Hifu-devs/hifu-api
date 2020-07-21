
task :send_alert => :environment do
  alerts = Route.find_alerts(Time.now.strftime("%Y-%m-%d %H:%M"))
  alerts.each do |alert|
    Faraday.post('https://hifu-sms.herokuapp.com/alert', alert)
  end
end
