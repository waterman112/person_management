class CreatePeoples < ActiveRecord::Migration
  def change
    create_table :peoples do |t|
      t.string :name
    end
  end
end
