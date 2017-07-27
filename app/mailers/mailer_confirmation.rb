class MailerConfirmation < ApplicationMailer
    default fron: "quentin.guillaume@quentinguillaume.com"
    
def welcome_email(user)
    @user = email
    @url = blocipedia.com
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

end
