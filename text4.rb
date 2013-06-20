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
    :body => "Reminder: Shuttle leaving for Friday Night Crawl from hotel lobby in+15 minutes. Shuttles are returing from drop off point at+12:30 and+1:30am."
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Call Jake at 716-239-9248 if you need assistance during this time."
  ) 
end