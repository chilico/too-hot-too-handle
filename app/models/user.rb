class User < ApplicationRecord
  after_create :create_sale

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :chillis
  has_many :sales

  private

  def create_sale
    Sale.create(user: self)
  end
end
