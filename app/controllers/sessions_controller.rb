class SessionsController < ApplicationController
  before_action :is_admin?, only: [:index]

  def index
  end

  def new
  end

  def create
    @error
    user = User.find_by_email(userparams[:email])
    if user && user.authenticate(userparams[:password])
      session[:type]=user.role
      if user.role=='admin'
        render 'index'
      else
        redirect_to user
      end
    else
      @error = "invalid credentials"
      render 'new'
    end
  end

  def destroy
    session[:type]=nil
    render 'new'
  end

  private

  def userparams
    params.require(:user).permit(:email, :password)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end

end
