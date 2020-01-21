class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]
    if user && user.password == password
      @message = 'Successful login!'
    else
      @message = 'Bad username/password. Bad!'
    end
    render :index
  end
end
