require 'twilio-ruby'

def send_message(phone)

  account_sid = 'AC4af8caa7b27a6d4fca2218da3fe1d909'
  auth_token = 'f1935f67339974bf861658eae18ba2fc'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+441412806560' # Your Twilio number
  to = phone # Your mobile phone number

  client.api.account.messages.create(
  from: from,
  to: to,
  body: "Thank you, your order was successful and will arrive at #{Time.now.hour+1}:#{Time.now.min}!"
  )
end
