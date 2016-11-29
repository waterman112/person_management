class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id, :comment => "与人员表进行关联查询"
      t.integer :state_id, :comment => "人员状态：例如：请假"
      t.string :content, :comment => "事件具体内容填写。例如：感冒发烧"
      t.date :start_date, :comment => "请假开始时间"
      t.date :end_date, :comment => "请假结束时间"
    end
  end
end
