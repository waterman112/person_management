class UsersController < ApplicationController

  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new user_params
    #if @user.save
    #  redirect_to user_path(@user)
    #elsif
    #  puts "#{@user}"
    #  render :text => "lala"
    #end
    User.create user_params
    puts "xixixixixxi=#{user_params}"
    #@user = User.new user_params
    puts "xixixixixxi=#{@user.inspect}"
    #render :text => 'alalal'
    redirect_to users_path
  end

  def show
    @user = User.find params[:id]
    @logs = Log.where("user_id = ?", params[:id])
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

  def show_user

    puts "xxxxxuser_search=#{params}"
    if params[:name] == ''
      if params[:state_name] == ''
        @results = User.all
      elsif
        @results = User.where("state_name = ?", params[:state_name])
      end
    elsif
      if params[:state_name] == ''
        @results = User.where('name = ?', params[:name])
      elsif
        @results = User.where('name = ?', params[:name]).where('state_name = ?', params[:state_name])
      end
    end
    #puts "xxxxxuser_search=#{params[:name]}"
    #render :text => "lalala"
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :id_card, :role, :phone, :email, :person_number, :state_id)
  end
end
