class Survey < ApplicationRecord
  has_many :questions, :dependent => :destroy
  has_many :answers, through: :questions
  before_save :create_parameterize
  has_many :poll_answers
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  #scope :polls,->{ where(":date >= date_init and :date <= date_end", date: Time.now.to_date) }

  private

  def create_parameterize
    self.permalink = self.name.parameterize
  end
end
