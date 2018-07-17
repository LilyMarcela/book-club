class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :books_owned, class_name:"Book", foreign_key: "owner_id"
  has_many :share_books, foreign_key: "taker_id"
  has_many :books_borrowed, through: :share_books, class_name: "Book"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
