class AdminMailer < ApplicationMailer
   default from: 'mflambjr@gmail.com'
   layout 'mailer'

   def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'mflambjr@gmail.com', subject: 'New User Awaiting Admin Approval')
   end
end
