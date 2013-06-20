require 'rubygems'
require 'twilio-ruby'
 
ACCOUNT_SID = "ACff661d56b0d1fdbc31917d5fd0f6c05b"
AUTH_TOKEN = "5995c907bf237c2a8570d8fa0c31ed37"

client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
 
FROM = "+17747664115" # Your Twilio number
 
ADMINS = {
    "+17162399248" => "Jake",
    "+14085823425" => "Hamida",
    "+16504215192" => "Terri",
  }
COMPANY = {

}.merge(ADMINS)

COMPANY.each do |phone, firstname|
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Welcome to the Inflection Bonfire Dinner. Eat, have fun, and get your groove on. We have shuttles returing to the hotel at 9, 9:30, and+10pm. "
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "If you plan to go out on the Friday night crawl, take the+10:30 shuttle from the hotel lobby."
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Call Terri at 650-421-5192 if you need assistance during this time."
  ) 
end