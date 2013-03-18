class ChangeWinOrLoseToStringInPicks < ActiveRecord::Migration
  def change
  	change_column :picks, :win_or_lose, :string
  end
end
