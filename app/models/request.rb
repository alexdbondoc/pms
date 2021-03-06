class Request < ApplicationRecord
	belongs_to :category
	belongs_to :department
	belongs_to :user
	has_many :consolidate_lines, dependent: :destroy
	has_many :request_lines, inverse_of: :request, dependent: :destroy
	accepts_nested_attributes_for :request_lines
	validates :reason, presence: true, length: { minimum: 15, maximum: 150}	

	searchable do 
		text :RISNum, :boost => 5
		text :user do
	      user.empname
	    end
		text :category do
	      category.name
	    end
	    integer :department_id
	    text :status, :reason
	    time :date_created
	end
end
