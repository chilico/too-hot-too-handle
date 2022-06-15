class User < ApplicationRecord
  after_create :create_sale

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :chillis, dependent: :destroy
  has_many :sales, dependent: :destroy

  has_many :chatrooms_as_seller, class_name: "Chatroom", foreign_key: :seller_id, dependent: :destroy
  has_many :chatrooms_as_buyer, class_name: "Chatroom", foreign_key: :buyer_id, dependent: :destroy

  has_many :messages, dependent: :destroy

  private

  def create_sale
    Sale.create(user: self, sale_sku: "user_sale_1")
  end
end
