class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, foreign_key: 'user_id', dependent: :destroy
  has_many :operations, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true
end
