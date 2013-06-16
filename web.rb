require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
 
get '/web' do
  sender = params[:From]
  friends = {
    "+17162399248" => "Jacob Brady",
  }
  name = friends[sender] || "Mobile Monkey"
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end