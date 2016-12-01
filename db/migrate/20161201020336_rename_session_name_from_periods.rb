class RenameSessionNameFromPeriods < ActiveRecord::Migration
  def change
    change_table :periods do |t|
      t.rename :session_name, :period_name
    end
  end
end
