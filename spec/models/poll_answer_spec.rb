require 'rails_helper'

RSpec.describe PollAnswer, type: :model do
  describe "create question" do
    let(:poll) { create(:poll_answer) }

    it "should be valid" do
      expect(poll).to be_valid
    end

    it "should be invalid with user_ip" do
      poll.user_ip = nil
      expect(poll).to be_invalid
    end

    it "should be invalid with answer id" do
      poll.answer_id = nil
      expect(poll).to be_invalid
    end
  end
end
