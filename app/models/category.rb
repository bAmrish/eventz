class Category < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :events, through: :categories

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
