class Period < ActiveRecord::Base
	validates_presence_of :start_date
	validates_presence_of :end_date
	
	has_many :transactions

  def processed_transactions
    transactions.select { |t| t.processed == true }.sort_by { |t| t.date }
  end

  def processed_transactions_total
    processed_transactions.sum { |t| t.amount } || BigDecimal("0:0")
  end

  def outstanding_transactions
    transactions.select { |t| t.processed != true }.sort_by { |t| t.date }
  end

  def outstanding_transactions_total
    outstanding_transactions.sum { |t| t.amount } || BigDecimal("0:0")
  end
	
	def total_transactions
		transactions.sum(:amount) || BigDecimal("0:0")
	end

  def init_period
    previous_period = Period.find(:last)
		if previous_period
			self.start_date = previous_period.end_date.next()
		else
			self.start_date = Date.new(2009,1,1)
		end
		self.end_date = self.start_date + 13
  end
	
	def append_recurring_transactions
		RecurringTransaction.find(:all).each do |t|
			nextDate = get_last_date(t.base_date, t.frequency)
			
			while get_next_working_day(nextDate) <= end_date do
				transactions.build(:description => t.description, :date => nextDate, :amount => t.amount)
				nextDate = get_next_date(nextDate, t.frequency)
			end
		end
	end
	
	def get_last_date(d, f)
		while d < start_date do
			d = get_next_date(d, f)
		end
		
		d
	end
	
	def get_next_date(d, f)
		case f
		when 1 # weekly
			d + 7 
		when 2
			d + 14 # bi-weekly
		when 3
			d >> 1 # monthly
		else
			d
		end
	end
	
	def get_next_working_day(d)
		case d.wday
		when 0
			d + 1
		when 6
			d + 2
		else
			d
		end
	end
end
