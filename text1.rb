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
    :body => "Hello #{firstname}, Welcome to Pismo Beach! Please note that this is where you'll meet for all shuttles leaving the hotel."
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "After you check in, you have until 6:15 to get settled in and explore. Stop by our hospitality suite #1234 for drinks and refreshments."
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Note that there's breakfast at the hotel from 7-10:30 tomorrow and 7-10:00 on Sunday. Breakfast is served at Marisol's; be sure to bring your vouchers."
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Call Hamida at 408-582-3425 if you need assistance during this time."
  ) 
end