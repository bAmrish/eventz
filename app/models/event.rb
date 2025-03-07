class Event < ApplicationRecord
  
  has_many :registrations, dependent: :destroy
  
  validates :name, presence: true
  validates :location, presence: true
  validates :description, length: {minimum: 25}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :capacity, numericality: {only_integer: true, greater_than: 0}
  validates :image_file_name, format: {
      with: /\w+\.(jpg|png)\z/i,
      message: 'must be a JPG or a PNG image'
  }

  # Get all the upcoming events 
  # ordered in ascending order of when they are starting
  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")  
  end

  def free?()
    return price.blank? || price.zero?
  end
end
