class ApplicationMailer < ActionMailer::Base
  default from: "x17161657@student.ncirl.ie"
 layout 'mailer'
 delivery_method = :smtp
end
