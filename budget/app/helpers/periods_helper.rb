module PeriodsHelper
	def total_transactions_style(period)
		period.total_transactions < 0 ? 'color: red' : 'color: black'
	end
end
