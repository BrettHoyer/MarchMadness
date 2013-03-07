class AddHomeOrAwayToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :home_or_away, :string
  end
end
