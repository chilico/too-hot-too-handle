class Chilli < ApplicationRecord
  belongs_to :user
  has_many :sale_chillis
  has_many :flags
  has_many_attached :photos
end
