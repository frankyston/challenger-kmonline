require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { should validate_presence_of(:name) }

  describe "create Survey" do
    let(:survey) { build(:survey) }

    it "should be valid" do
      expect(survey).to be_valid
    end

    it "should be invalid" do
      survey.name = ''
      expect(survey).to be_invalid
    end
  end
end
