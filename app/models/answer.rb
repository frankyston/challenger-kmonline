class Answer < ApplicationRecord
  belongs_to :question
  #has_many :poll_answers
end
