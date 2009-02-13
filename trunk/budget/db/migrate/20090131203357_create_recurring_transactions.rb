class CreateRecurringTransactions < ActiveRecord::Migration
  def self.up
    create_table :recurring_transactions do |t|
      t.string :description
      t.decimal :amount
      t.date :base_date
      t.integer :frequency

      t.timestamps
    end
  end

  def self.down
    drop_table :recurring_transactions
  end
end
