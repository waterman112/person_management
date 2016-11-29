class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :user_id, :comment => "人员id"
      t.integer :session_id, :comment => "session表id"
    end
  end
end
