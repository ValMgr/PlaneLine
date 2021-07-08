class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    @reservation = params[:reservation]
    @vol = params[:vol]
    @url  = 'http://127.0.0.1:3000/login'

    mail(to: @user.email, subject: 'Bienvenue sur mon magnifique site')
  end
end
