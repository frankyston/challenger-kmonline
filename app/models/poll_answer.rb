class PollAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :answer
  validates :user_ip, :survey_id, :answer_id, presence: true
  validates_uniqueness_of :user_ip, scope: :survey_id
end
