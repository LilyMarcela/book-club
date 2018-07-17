class ShareBook < ApplicationRecord
  belongs_to :taker, class_name: "User", foreign_key: "taker_id"
  belongs_to :book
end
