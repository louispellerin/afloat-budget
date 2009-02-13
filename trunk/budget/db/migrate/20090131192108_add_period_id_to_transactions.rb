class AddPeriodIdToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :period_id, :integer
  end

  def self.down
    remove_column :transactions, :period_id
  end
end
