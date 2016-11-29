class SessionsController < ApplicationController
  def index
  end

  def new
    @session = Session.new
  end

  def create


    #这里我还要考虑是否存在重复的问题
    puts "---#{session_params}---"

    Session.all.each do |f|
      if f.session_name != params[:session][:session_name] || f.session_name != params[:session][:class_name]
        #将新建的届，班级，存入到数据库中去
        @session = Session.create session_params
        redirect_to session_path(@session)
        #puts "---#{session_params}---"
      else
        #返回一个信息，告知存在重复
        @error = "#{params}信息已存入数据库"
      end



    end







  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def session_params
    params.require(:session).permit(:session_name, :class_name, :state_id)
  end
end
