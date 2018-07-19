class Book < ApplicationRecord
	searchkick

  belongs_to :category

  has_many :share_books
  has_many :takers, through: :share_books, class_name: 'User', foreign_key: 'taker_id'

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  def self.per_page
	  15
  end
end
