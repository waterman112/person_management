class RenameSessionIdFromGrades < ActiveRecord::Migration
  def change
    change_table :grades do |t|
      t.rename :session_id, :period_id
    end
  end
end
