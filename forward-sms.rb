require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
 get '/forward-sms' do	
  account_sid = "ACff661d56b0d1fdbc31917d5fd0f6c05b"
  auth_token = "5995c907bf237c2a8570d8fa0c31ed37"
  client = Twilio::REST::Client.new account_sid, auth_token
 
  from = "+17747664115" # Your Twilio number
 
    client.account.sms.messages.create(
      :from => from,
      :to => "+17162399248",
      :body => "Hey, Welcome to Pismo Beach!"
    ) 
  puts "Sent message to"
end