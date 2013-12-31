class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor


  def handle_inbound(event_payload)
    message = Message.new
    puts event_payload.inspect
    message.receiver_id = 2
    message.sender_id = 1
    message.content = 'true story'
    message.save
  end
end