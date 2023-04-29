class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_costs, dependent: :destroy
  has_many :costs, through: :group_costs, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :author, message: 'Already Exist' }
  validates :icon, presence: true
end
