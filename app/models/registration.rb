class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  HOW_HEARD_OPTIONS = [
    "Newsletter", 
    "Twitter",
    "Web Search",
    "Friend",
    "Other"
  ]

  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }
  
end
