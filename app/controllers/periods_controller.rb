class PeriodsController < ApplicationController

  #before_filter :authenticate_user!

  def index
    @periods = Period.order(period_name: :asc).all
    @periods.map do |f|
      #今年刚入学的学生算一年级,如果遇到什么nil, 则到数据库找原因
      f.period_name = Time.now.year - f.period_name + 1
    #  puts "xxxxxxxxxperiod_name=#{f.period_name}"
    end
  end

  def new
    @period = Period.new
  end

  def create

    #这里我还要考虑是否存在重复的问题
  #  puts "---#{period_params}---"

    #将前端数据，与后端进行对比，如果相同，则返回错误，如果不同，则存入数据库
    #两种方法：
    #1将数据和后端每个都进行对比，如果相同，则不存入。这有个问题，如果对比时前几个都不同，那么就得执行好几次if 操作。
    #
    #2将前端数据,通过where查询的方式，如果查询不到，则认为数据库中没有这条记录，则将记录存入数据库。

    @result = Period.where("period_name=?",params[:period][:period_name]).where("class_name=?",params[:period][:class_name])
  #  puts "oooooooooooooooooooooo#{@result}ooo"

    #这里的困惑  empty? 和 nil 之间的关系？  @result.empty? #true/false
    if @result.empty?
      @period = Period.create period_params
      redirect_to periods_path
    else
      redirect_to new_period_path
    end
  end

  def show
    @period = Period.find params[:id]
  end

  def edit
    @period = Period.find params[:id]
    @periods = Period.all

  end


  #update,注意事项：period的id不会变
  def update
    @period = Period.find params[:id]

    @result = Period.where.not("id = #{params[:id]}").where("period_name=?",params[:period][:period_name]).where("class_name=?",params[:period][:class_name])
   # puts "xxxxxxxxxxxx@result=#{@result.inspect}"
    if @result.empty?
   #   puts "xxxxxxxxxxxxparams[:id]= #{params[:id]}"
   #   puts "xxxxxxxxxxx@result.empty=#{@result.empty?}"
   #   puts "xxxxxxxxxxxperiod_params=#{session_params}"

    #  @period = @session.update session_params
      @period.update period_params
      redirect_to @period
    else
      #当数据库中已有数据，则返回到edit页面，重新编辑
      #在重定向的时候，传值。
      redirect_to edit_period_path(@period)
    end
  end

  def destroy
    @period = Period.find params[:id]
    @period.destroy
    redirect_to periods_path
  end

  def show_period
    puts "xxxxxxshow_period=#{params}"
    @results = Period.where("period_name = ?", params[:period_name])
  end

  private
  def period_params
    params.require(:period).permit(:period_name, :class_name, :state_id)
  end
end
