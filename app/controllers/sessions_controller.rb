class SessionsController < ApplicationController

  #before_filter :authenticate_user!

  def index
    @sessions = Session.order(session_name: :asc).all
    @sessions.map do |f|
      #今年刚入学的学生算一年级
      f.session_name = Time.now.year - f.session_name + 1
    #  puts "xxxxxxxxxsession_name=#{f.session_name}"
    end
    puts "xxxxxxxxxxxsessions=#{@sessions.inspect}"
  end

  def new
    @session = Session.new
  end

  def create

    #这里我还要考虑是否存在重复的问题
  #  puts "---#{session_params}---"

    #将前端数据，与后端进行对比，如果相同，则返回错误，如果不同，则存入数据库
    #两种方法：
    #1将数据和后端每个都进行对比，如果相同，则不存入。这有个问题，如果对比时前几个都不同，那么就得执行好几次if 操作。
    #
    #2将前端数据,通过where查询的方式，如果查询不到，则认为数据库中没有这条记录，则将记录存入数据库。

    @result = Session.where("session_name=?",params[:session][:session_name]).where("class_name=?",params[:session][:class_name])
  #  puts "oooooooooooooooooooooo#{@result}ooo"

    #这里的困惑  empty? 和 nil 之间的关系？  @result.empty? #true/false
    if @result.empty?
      @session = Session.create session_params
      redirect_to session_path(@session)
    else
      redirect_to new_session_path
    end
  end

  def show
    @session = Session.find params[:id]
  end

  def edit
    @session = Session.find params[:id]

  end


  #update,注意事项：session的id不会变
  def update
    @session = Session.find params[:id]

    @result = Session.where.not("id = #{params[:id]}").where("session_name=?",params[:session][:session_name]).where("class_name=?",params[:session][:class_name])
   # puts "xxxxxxxxxxxx@result=#{@result.inspect}"
    if @result.empty?
   #   puts "xxxxxxxxxxxxparams[:id]= #{params[:id]}"
   #   puts "xxxxxxxxxxx@result.empty=#{@result.empty?}"
   #   puts "xxxxxxxxxxxsession_params=#{session_params}"

    #  @session = @session.update session_params
      @session.update session_params
      redirect_to @session
    else
      #当数据库中已有数据，则返回到edit页面，重新编辑
      #在重定向的时候，传值。
      redirect_to edit_session_path({id: @session.id })
    end
  end

  def destroy
    @session = Session.find params[:id]
    @session.destroy

    redirect_to sessions_path

  end

  private
  def session_params
    params.require(:session).permit(:session_name, :class_name, :state_id)
  end
end
