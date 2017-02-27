class Order < ApplicationRecord
	belongs_to :user
	belongs_to :supplier
	has_many :order_lines, inverse_of: :order, dependent: :destroy
	accepts_nested_attributes_for :order_lines
	has_one :receive, dependent: :destroy
	validates :supplier_id, presence: true
	validates :delivery_date, presence: true

	searchable do 
		text :PONumber, :boost => 5
		text :supplier do
	      supplier.name
	    end
	    text :user do
	    	user.empname
	    end
	    text :status, :terms, :total_amount
	    date :delivery_date
	    time :created_at
	end
end
