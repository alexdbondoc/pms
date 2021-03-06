class Inventory < ApplicationRecord
	belongs_to :receive, inverse_of: :inventories
	belongs_to :type
	belongs_to :unit
	belongs_to :product
	belongs_to :category
	has_one :assign_line, dependent: :destroy
end
