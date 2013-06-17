require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/forward-sms' do	
  sender = params[:From]
  friends = {
    "+7162399248" => "Jake",
  }
  bodytext = params[:Body]
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "#{bodytext}"
  end
  twiml.text
end