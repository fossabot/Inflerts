require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/forward-sms' do	
  account_sid = "ACff661d56b0d1fdbc31917d5fd0f6c05b"
  auth_token = "5995c907bf237c2a8570d8fa0c31ed37"
  client = Twilio::REST::Client.new account_sid, auth_token
 
  from = "+17747664115" # Your Twilio number
  bodytext = params[:Body]
  replynumber = params[:From]

  roster = {
    "+17162399248" => "Jake",
  }


  replyname = roster[replynumber] || "Unknown"

  if replynumber == "+17162399248" && bodytext.include?("#public")
    bodytext.slice! "#public"
    roster.each do |key, value|
      client.account.sms.messages.create(
        :from => from,
        :to => key,
        :body => "Test. #{bodytext}"
      )
    end
  elsif replynumber == "+17162399248" 
    client.account.sms.messages.create(
      :from => from,
      :to => "#{replynumber}",
      :body => "Did you mean to send a text to everyone? If so, type \"#public\" somewhere in your message."
    ) 
  else 
    client.account.sms.messages.create(
      :from => from,
      :to => "+17162399248",
      :body => "From #{replyname}: #{bodytext} | Reply to: #{replynumber}"
    ) 
  end
end