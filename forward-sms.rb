require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/forward-sms' do	
  sender = params[:From]
  friends = {
    "+7162399248" => "Jake",
  }
  bodytext = params[:Body]
  from = "+17747664115"
  client = Twilio::REST::Client.new account_sid, auth_token

  client.account.sms.messages.create(
    :from => from,
    :to => "+7162399248",
    :body => "#{bodytext}"
  ) 
end