class Operation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_operations, foreign_key: 'group_id'
  has_many :groups, through: :group_operations

  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
