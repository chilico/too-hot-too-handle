class User < ApplicationRecord
  after_create :create_sale

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :chillis, dependent: :destroy
  has_many :sales, dependent: :destroy

  private

  def create_sale
    Sale.create(user: self, sale_sku: "user_sale_1")
  end
end
