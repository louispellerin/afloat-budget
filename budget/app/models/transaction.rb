class Transaction < ActiveRecord::Base
	validates_presence_of :description
	validates_presence_of :date
	validates_presence_of :amount
	validates_numericality_of :amount
	
	belongs_to :period
end
