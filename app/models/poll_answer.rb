class PollAnswer < ApplicationRecord
  belongs_to :survey
  belongs_to :answer
  validates_uniqueness_of :user_ip, scope: :survey_id
end
