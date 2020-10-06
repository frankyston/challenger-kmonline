require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of(:content) }

  describe "create question" do
    let(:question) { build(:question) }

    it "should be valid" do
      expect(question).to be_valid
    end

    it "should be invalid" do
      question.content = ''
      expect(question).to be_invalid
    end
  end
end
