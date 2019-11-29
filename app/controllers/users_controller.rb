class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  before_action :is_admin?, except: [:show]
  before_action :is_user?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @error
    @user = User.new(userparams)
    if @user.save
      redirect_to @user
    else
      @error="Enter valid email id and correct password"
      render 'new'
    end
  end

  def edit
  end

  def update
    @error
    if @user.update(userparams)
      redirect_to @user
    else
      @error="Enter valid email id and correct password"
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.delete
    redirect_to '/users'
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def userparams
    params.require(:user).permit(:fname,:lname,:dob,:doj,:sal,:contact,:bloodtype,:address,:city,:state,:gender,:notice,
    :country,:pincode,:ename,:relation,:econtact,:pskill,:sskill1,:sskill2,:role,:email,:password,:password_confirmation)
  end

  def is_admin?
    unless session[:type]=='admin'
      redirect_to root_path
    end
  end

  def is_user?
    unless session[:id]==@user.id || session[:type]=='admin'
      redirect_to root_path
    end
  end
end
