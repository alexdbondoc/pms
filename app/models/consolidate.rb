class Consolidate < ApplicationRecord
	belongs_to :category
	belongs_to :department
	belongs_to :user
	has_many :consolidate_lines, inverse_of: :consolidate, dependent: :destroy
	has_many :order_lines, dependent: :destroy
	accepts_nested_attributes_for :consolidate_lines
	validates :purpose, presence: true, length: { minimum: 15, maximum: 150}

	searchable do 
		text :ConsNum, :boost => 5
		text :category do
	      category.name
	    end
	    text :department do
	    	department.name
	    end
	    text :user do
	    	user.empname
	    end
	    integer :department_id
	    integer :user_id
	    integer :inspected_by
	    integer :officer_id
	    text :status, :purpose
	    time :created_at
	end
end
