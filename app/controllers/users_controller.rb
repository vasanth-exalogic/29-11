class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(userparams)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(userparams)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.delete
    render 'index'
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def userparams
    params.require(:user).permit(:fname,:lname,:dob,:doj,:sal,:contact,:bloodtype,:address,:city,:state,
    :country,:pincode,:ename,:relation,:econtact,:pskill,:sskill1,:sskill2,:role,:email,:password,:password_confirmation)
  end

end
