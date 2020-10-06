class Answer < ApplicationRecord
  belongs_to :question
  has_many :poll_answers

  validates :content, presence: true
end
