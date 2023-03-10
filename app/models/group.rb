class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_operations, foreign_key: 'operation_id'
  has_and_belongs_to_many :operations
  has_one_attached :icon do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
