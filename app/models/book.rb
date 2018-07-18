class Book < ApplicationRecord
	# searchkick
	has_many :book_categories
	has_many :categories,through: :book_categories

	has_many :share_books
	belongs_to :owner, class_name: "User", foreign_key:"owner_id"


end
