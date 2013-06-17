require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/forward-sms' do	
  sender = params[:From]
  friends = {
    "+7162399248" => "Jake",
  }
  bodytext = params[:Body]
  fowardmessage = friends[sender] || "empty"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "#{fowardmessage}"
  end
  twiml.text
end