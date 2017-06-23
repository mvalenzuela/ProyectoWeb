class Suggestion < ApplicationRecord
  belongs_to :document
  belongs_to :user

  validates :document, {
      presence: true,
      associated: true
  }
  validates :user, {
      presence: true,
      associated: true
      #permision
  }
  validates :text, {
      length: { maximum: 500 },
      presence: true
  }
  validates :status, :inclusion => {:in => ["Pending", "Rejected", "Implemented"]}

end
