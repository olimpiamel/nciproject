class HelpmailerMailer < ActionMailer::Base
  default from: 'x17161657@student.ncirl.ie'



  def help_form_email(user)
    @user = user
    @emailaddress = "x17161657@student.ncirl.ie"
    @url = 'static_pages/help'
    mail(to: @emailaddress, subject: 'User help request')
  end
end
