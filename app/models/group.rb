class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_operations, foreign_key: 'operation_id'
  has_many :operations, through: :group_operations

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
