class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :round
      t.integer :amount
      t.references :investor
      t.references :company
    end
  end
end
