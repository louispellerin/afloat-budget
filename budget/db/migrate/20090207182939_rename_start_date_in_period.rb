class RenameStartDateInPeriod < ActiveRecord::Migration
  def self.up
    change_table :periods do |t|
       t.rename :startDate, :start_date
    end
  end

  def self.down
    change_table :periods do |t|
       t.rename :start_date, :startDate
    end
  end
end
