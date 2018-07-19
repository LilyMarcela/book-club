class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books_owned, class_name: 'Book', foreign_key: 'owner_id'

  has_many :share_books, foreign_key: 'taker_id'
  has_many :books_borrowed, through: :share_books, source: :book

  def books_shared
    book_ids = books_owned.map(&:id)
    Book.joins(:share_books).where('share_books.book_id': book_ids)
  end
  scope :admin, -> { where(admin: true) }
end
