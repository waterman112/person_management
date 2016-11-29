class CerateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state_name, :comment => "各种可能的事件：例如：请假"
      t.integer :role, :comment => "在这里，我们将人的状态和班级的状态做一个区分例如学生为0,班级为1"
    end
  end
end
