class MessageMailer < ActionMailer::Base

  def has_new_message message
    @content = message.content
    @user = message.user
    roomers = message.room.roomers.reject{ |u| u == message.user }
    roomers = roomers.map(&:email).join('>, <')
    mail(to: "<#{roomers}>",
         from: "#{message.user.name} <#{message.room.id}@user.studyka.com>",
         subject: "#{message.user.name} à écrit un nouveaux message pour la room #{message.room.id}")
  end
end
