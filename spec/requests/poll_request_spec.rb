require 'rails_helper'

RSpec.describe "Polls", type: :request do
  let!(:survey) { create(:survey) }
  let!(:question) { create(:question, survey: survey) }
  let!(:answer) { create(:answer, question: question) }

  describe "GET #index" do
    it "returns http success" do
      get polls_url
      expect(response).to have_http_status(:success)
    end

    it "should variable polls assings" do
      get polls_url
      expect(assigns(:polls)).to eq([survey])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get poll_url(survey.permalink)
      expect(response).to have_http_status(:success)
    end

    it "should variable polls assings" do
      get poll_url(survey.permalink)
      expect(assigns(:voted)).to be_falsey
      expect(assigns(:poll_answer)).to be_a_new(PollAnswer) 
    end
  end

  describe "POST #create" do
    it "should success poll" do
      params = { poll_answer: { answer_id: answer.id } } 
      post send_poll_answer_path(survey.permalink), params: params
      expect(flash[:success]).to eq "Pesquisa realizada com sucesso. Em breve divulgaremos o resultado."
    end

    it "should error poll" do
      params = { poll_answer: { answer_id: nil } } 
      post send_poll_answer_path(survey.permalink), params: params
      expect(flash[:error]).to eq "Erro ao realizar a pesquisa ou você já realizou sua pesquisa."
    end
  end
end
