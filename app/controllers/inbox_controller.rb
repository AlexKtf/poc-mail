class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor


  def handle_inbound(event_payload)
    message = Message.new
    payload = event_payload['msg']
    message.sender_id = User.find_by_email(payload['from_email']).id
    message.receiver_id = User.find_by_name(payload['headers']['To'][0..-18]).id
    message.content = payload['text']
    message.save
  end
end