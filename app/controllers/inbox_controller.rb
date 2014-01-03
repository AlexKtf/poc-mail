class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor


  def handle_inbound(event_payload)
    message = Message.new
    payload = event_payload['msg']
    message.user_id = User.find_by_email(payload['from_email']).id
    message.room_id = Room.find(payload['headers']['To'][0..-18].to_i).id
    message.content = payload['text']
    message.save
  end
end