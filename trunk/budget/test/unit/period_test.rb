require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  test "the transactions sum is correctly calculated" do
	period = Period.new(:start_date => Date.today, :end_date => Date.today)
	period.transactions.build(:description => "description", :date => Date.today, :amount => BigDecimal("30"))
	period.transactions.build(:description => "description", :date => Date.today, :amount => BigDecimal("20"))	
	assert period.save
	
	assert_equal 2, period.transactions.count
	
	assert_equal BigDecimal("50"), period.total_transactions
  end
  
  test "last date is correctly calculated" do
	base_date = @january.start_date - 7
	last_date =  @january.get_last_date(base_date, 1)
	
	assert_equal @january.start_date, last_date
  end
  
  test "the next date is calculated according to frequency" do
	date = Date.today
	period = Period.new(:start_date => date, :end_date => date)
	assert period.save
	
	assert_equal date + 7, period.get_next_date(date, 1)
	assert_equal date + 14, period.get_next_date(date, 2)
	assert_equal date >> 1, period.get_next_date(date, 3)
	assert_equal date, period.get_next_date(date, 4)
  end
  
  test "the next working day is correctly calculated" do
	today = Date.today
	sunday = today - today.wday
	saturday = sunday - 1 
	monday = sunday + 1
	tuesday = sunday + 2
	wednesday = sunday + 3
	thursday = sunday + 4
	friday = sunday + 5
	
	period = Period.new(:start_date => today, :end_date => today)
	assert period.save
	
	assert_equal monday, period.get_next_working_day(saturday)
	assert_equal monday, period.get_next_working_day(sunday)
	assert_equal monday, period.get_next_working_day(monday)
	assert_equal tuesday, period.get_next_working_day(tuesday)
	assert_equal wednesday, period.get_next_working_day(wednesday)
	assert_equal thursday, period.get_next_working_day(thursday)
	assert_equal friday, period.get_next_working_day(friday)
  end
  
  test "the period is populated with recurring transactions" do
	@january.append_recurring_transactions
	
	assert @january.save

	assert_equal 6, @january.transactions.count
  end
end
