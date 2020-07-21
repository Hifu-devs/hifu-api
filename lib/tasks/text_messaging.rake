
task :text_message => :environment do
  Faraday.post('https://hifu-sms.herokuapp.com/alert', '{ "phone": "+13038758190", "name": "Joe Smith", "activity": "kayaking", "email": "friend@example.com" }')
  puts 'Send text message alert'
end
