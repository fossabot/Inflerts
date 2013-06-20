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
  # "+18583444981"=>"Ben",
  # "+13019105269"=>"Bobby",
  # "+16263545843"=>"Carina",
  # "+17082054848"=>"Clarke",
  # "+18084462505"=>"Drago",
  # "+16177636660"=>"Eric G",
  # "+18456429307"=>"Eli",
  # "+17349040940"=>"Erik O",
  # "+15305640045"=>"Eric H",
  # "+14084499664"=>"Eugene",
  # "+19086166752"=>"Flora",
  # "+14085823425"=>"Hamida",
  # "+17162399248"=>"Jake",
  # "+19254008565"=>"Jeremy",
  # "+16507968740"=>"Kalpana",
  # "+16503870506"=>"Kevin",
  # "+16507144724"=>"Krisan",
  # "+16507767237"=>"Matthew",
  # "+14157285669"=>"Max",
  # "+14022039247"=>"Michele",
  # "+15102090010"=>"Nachi",
  # "+14088572955"=>"Natalie",
  # "+14088860435"=>"Neekaan",
  # "+19255186492"=>"Omar",
  # "+16177589340"=>"Pili",
  # "+16503933767"=>"Rebecca",
  # "+16062692091"=>"Rhea",
  # "+18477226071"=>"Suman",
  # "+13105622667"=>"Tiffany",
  # "+17322849174"=>"T Money",
  # "+13034757244"=>"Tristan",
  # "+12066961283"=>"Whitney",
  # "+18123698782"=>"Xuan",
  # "+16503800287"=>"Margaret",
  # "+16175950206"=>"Brian",
  # "+16504553080"=>"Britian",
  # "+12027797000"=>"Igor",
  # "+14082204006"=>"Jae",
  # "+14159714125"=>"Jeff",
  # "+14238383701"=>"John",
  # "+13038181175"=>"Kai",
  # "+14158472625"=>"Lynn",
  # "+12482106148"=>"Peter",
  # "+16507404065"=>"Roksolana",
  # "+14026894626"=>"Sarah",
  # "+16503464168"=>"Stephanie",
  # "+16504215192"=>"Terri",
  # "+14083090890"=>"Yev",
  # "+14154399774"=>"Andrea",
  # "+17143431641"=>"Tyler",
  # "+14802018042"=>"Ashley",
  # "+14087994043"=>"Mike",
  # "+12483460366"=>"Yuheng",
  # "+16503500188"=>"Avanti",
  # "+16507049825"=>"Crystal",
  # "+16048386088"=>"John",
}.merge(ADMINS)

COMPANY.each do |phone, firstname|
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Hello #{firstname}, Welcome to Pismo Beach! Please note that this is where you'll meet for all shuttles leaving the hotel.(1/4)"
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "After you check in, you have until 6:15 to get settled in and explore. Stop by our hospitality suite #1234 for drinks and refreshments.(2/4)"
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Note that there's breakfast at the hotel from 7-10:30 tomorrow and 7-10:00 on Sunday. Breakfast is served at Marisol's; be sure to bring your vouchers.(3/4)"
  ) 
  client.account.sms.messages.create(
    :from => FROM,
    :to => phone,
    :body => "Call Hamida at 408-582-3425 if you need assistance during this time.(4/4)"
  ) 
end