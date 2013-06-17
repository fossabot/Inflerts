require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/sms-quickstart' do
  sender = params[:From]
  friends = {
    "+17162399248" => "Jake",
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end