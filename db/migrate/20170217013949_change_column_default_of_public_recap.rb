class ChangeColumnDefaultOfPublicRecap < ActiveRecord::Migration
  def up
    change_column_default :rounds, :public_recap, true
  end

  def down
    change_column_default :rounds, :public_recap, false
  end
end
