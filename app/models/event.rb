class Event < ApplicationRecord
  def free?()
    return price.blank? || price.zero?
  end
end
