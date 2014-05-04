class ChangeAttrOfInvestements < ActiveRecord::Migration
  def change
    remove_column :investments, :amount
    remove_column :investments, :company_id
    add_column :investments, :date, :date
  end

end
