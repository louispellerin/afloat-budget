class RenameEndDateInPeriod < ActiveRecord::Migration
  def self.up
    change_table :periods do |t|
       t.rename :endDate, :end_date
    end
  end

  def self.down
    change_table :periods do |t|
       t.rename :end_date, :endDate
    end
  end
end
