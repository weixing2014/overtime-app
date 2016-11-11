class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :date, presence: true
  validates :rationale, presence: true
  enum status: { submitted: 0, approved: 1, rejected: 2 }
end
