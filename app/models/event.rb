class Event < ApplicationRecord
  
  # Get all the upcoming events 
  # ordered in ascending order of when they are starting
  def self.upcoming
    where("starts_at > ?", Time.now).order("starts_at")  
  end

  def free?()
    return price.blank? || price.zero?
  end
end
