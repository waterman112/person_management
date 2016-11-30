class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name, :comment => "名字,例如:小红"
      t.string :sex, :comment => "性别,例如：男"
      t.integer :age, :comment => "年龄,例如:12"
      t.string :id_card, :comment => "身份证"
      t.string :role, :comment => "角色,例如：老师"
      t.integer :phone, :comment => "手机号码"
      t.string :email, :comment => "性别。例如：男"
      t.integer :person_number, :comment => "借书证"
      t.integer :state_id, :comment => "人员状态,例如：毕业"
    end
  end
end
