class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
