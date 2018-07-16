class Book < ApplicationRecord
	searchkick
	has_many :book_categories
	has_many :categories,through: :book_categories


end
