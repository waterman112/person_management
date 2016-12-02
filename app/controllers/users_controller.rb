class UsersController < ApplicationController

  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create user_params
    Period.create :period_name => params[:period][:period_name], :class_name => params[:period][:class_name]
    redirect_to users_path
  end

  def show
    @user = User.find params[:id]
    @logs = Log.where("user_id = ?", params[:id])
  end

  def edit
    @user = User.find params[:id]
    @period = @user.periods
    @state = @user.states
    puts "xxxxedit@period=#{@period.inspect}x"
    puts "xxxxedit@period=#{@period.first.period_name}x"
    #puts "xxxxedit@state=#{@state}"
  end

  def update
    #puts "xxxxupdate=#{params}"
    @user = User.find params[:id]
    @period = Period.find params[:id]
    puts "xxx@user=#{@user.inspect}"
    puts "xxxupdateparams=#{params}"
    #@user.update user_params
    #@period.update :period_name => params[:period][:period_name], :class_name => params[:period][:class_name], :state_id => params[:period][:state_id]
    render :text => 'lala'
    #redirect_to users_path
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end

  def show_user
    #puts "xxxxxuser_search=#{params}"
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :sex, :age, :id_card, :role, :phone, :email, :person_number, :state_id)
  end
end
