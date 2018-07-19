class Book < ApplicationRecord
	searchkick

  has_many :book_categories
  has_many :categories,through: :book_categories

  has_many :share_books
  has_many :takers, through: :share_books, class_name: 'User', foreign_key: 'taker_id'

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  
  def self.per_page
	  15
  end

  def key
    owner_id.to_s + title
  end

  mount_uploader :bookpdf, BookpdfUploader
end
