require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:content) }

  describe "create question" do
    let(:answer) { build(:answer) }

    it "should be valid" do
      expect(answer).to be_valid
    end

    it "should be invalid" do
      answer.content = ''
      expect(answer).to be_invalid
    end
  end
end
