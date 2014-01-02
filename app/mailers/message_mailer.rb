class MessageMailer < ActionMailer::Base

  def has_new_message message
    @content = message.content
    mail(to: '<alexandre.ktifa@gmail.com>',
         from: "<#{message.user.name}@user.studyka.com>",
         subject: "Please see the Terms and Conditions attached")
  end
end
