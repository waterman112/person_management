class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :session_name, :comment => "届标号：例如数字2015"
      t.integer :class_name, :comment => "班级标号：例如数字1"
      t.integer :state_id, :comment => "班级状态：如：毕业"
    end
  end
end
