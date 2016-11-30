class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    puts "xxxxxxxxpeople.all=#{User.all.inspect}"
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    redirect_to @user
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params

    redirect_to users_path

  end

  def destroy
    @user = User.find params[:id]

    @user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :id_card, :role, :phone, :email, :person_number, :state_id)
  end
end
