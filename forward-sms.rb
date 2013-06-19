require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

ACCOUNT_SID = "ACff661d56b0d1fdbc31917d5fd0f6c05b"
AUTH_TOKEN = "5995c907bf237c2a8570d8fa0c31ed37"
FROM = "+17747664115" # My Twilio number
ADMINS = {
    "+17162399248" => "Jake",
    # "+14085823425" => "Hamida",
    # "+16504215192" => "Terri",
  }
COMPANY = {

}.merge(ADMINS)

def client
  Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
end

 
get '/forward-sms' do	
  return unless params[:Body]
  
  bodytext = params[:Body]
  replynumber = params[:From]
  
  from_admin = ADMINS[replynumber] 
  replyname = COMPANY[replynumber] || "Unknown"

  if from_admin && bodytext.include?("#public")
    bodytext.slice! "#public "
    COMPANY.each do |phone, firstname|
      client.account.sms.messages.create(
        :from => FROM,
        :to => phone,
        :body => bodytext[0..159]
      )
    end
  elsif from_admin
    client.account.sms.messages.create(
      :from => FROM,
      :to => replynumber,
      :body => "Did you mean to send a text to everyone? If so, type \"#public\" somewhere in your message."
    ) 
  else 
    client.account.sms.messages.create(
      :from => FROM,
      :to => "+17162399248",
      :body => "From #{replyname}: #{bodytext[0..110]} | Reply: #{replynumber}"
    ) 
  end
end
