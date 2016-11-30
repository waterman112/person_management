class PeopleController < ApplicationController

  def index
    puts "xxxxxxxxpeople.all=#{Person.all.inspect}"
    @people = Person.all
  end

  def new
    @people = People.new
  end

  def create

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
  def person_params
    params.require(:people).permit(:name, :sex, :age, :id_card, :role, :phone, :email, :person_number, :state_id)
  end
end
