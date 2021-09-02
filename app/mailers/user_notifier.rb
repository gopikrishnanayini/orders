class UserNotifier < ActionMailer::Base

  def send_email_notification(email, order)
    @order = order
    subject = "Hello ! #{order.name} !"
    mail(to: email, subject: subject, :from => "info@example.com") do |format|
      format.html { render 'user_notifiers/send_email_notification' }
    end
  end
  
end