
task :send_alert => :environment do
  Route.send_alerts(Time.now.strftime("%Y-%m-%d %H:%M"))

    Faraday.post('https://hifu-sms.herokuapp.com/alert', "{ 'phone': +13038758190, 'name': Landon Schiller, 'activity': returning, 'email': patty@example.com }")
end
