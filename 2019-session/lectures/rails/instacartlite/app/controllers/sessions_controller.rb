class SessionsController < ApplicationController
  def new
    redirect_to :root if current_user
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]

    if user && user.password == password
      @message = 'Successful login!'

      session[:user_id] = user.id
    else
      @message = 'Bad username/password. Bad!'
    end

    render :index
  end
end
