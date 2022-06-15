class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
