class Cost < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_costs, dependent: :destroy
  has_many :groups, through: :group_costs, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
