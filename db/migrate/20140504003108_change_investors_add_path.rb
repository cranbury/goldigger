class ChangeInvestorsAddPath < ActiveRecord::Migration
  def change
    add_column :investors, :path, :string
  end
end
