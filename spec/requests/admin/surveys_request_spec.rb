require 'rails_helper'

RSpec.describe Admin::SurveysController, type: :request do
  let!(:user) { create(:user, :admin) }
  before { sign_in user }

  let!(:survey) { create(:survey) }
  let!(:question) { create(:question, survey: survey) }
  let!(:answer) { create(:answer, question: question) }

  describe "GET #index" do
    it "returns http success" do
      get admin_surveys_url
      expect(response).to have_http_status(:success)
    end

    it "should variable surveys assings" do
      get admin_surveys_url
      expect(assigns(:surveys)).to eq([survey])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get admin_survey_url(survey)
      expect(response).to have_http_status(:success)
    end

    it "should variable survey assings" do
      get admin_survey_url(survey)
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_admin_survey_url
      expect(response).to have_http_status(:success)
    end

    it "should variable survey assings" do
      get new_admin_survey_url
      expect(assigns(:survey)).to be_a_new(Survey)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get edit_admin_survey_url(survey)
      expect(response).to have_http_status(:success)
    end

    it "should variable survey assings" do
      get edit_admin_survey_url(survey)
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "POST #create" do
    it "should success" do
      params = { survey: new_survey_params }
      post admin_surveys_url, params: params
      expect(flash[:notice]).to eq "Pesquisa Criada com sucesso."
    end

    it "should error" do
      params = { survey: new_survey_params_error }
      post admin_surveys_url, params: params
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    it "should success" do
      params = { survey: update_survey_params }
      put admin_survey_url(survey), params: params
      expect(flash[:notice]).to eq "Pesquisa atualizada com sucesso."
      survey.reload
      expect(survey.name).to eq "Teste rspec Update"
    end
  end

  describe "PUT #delete" do
    it "should success" do
      delete admin_survey_url(survey)
      expect(flash[:notice]).to eq "Pesquisa excluída com sucesso."
    end
  end

  def new_survey_params
    { name: "Teste rspec", "date_init(3i)"=>"6", "date_init(2i)"=>"10", "date_init(1i)"=>"2020", "date_end(3i)"=>"6", "date_end(2i)"=>"10", "date_end(1i)"=>"2020", 
      questions_attributes: { "0"=>{"content"=>"RPG é LEGAL?", 
          answers_attributes: {"0"=>{"content"=>"Sim", "_destroy"=>"0"}, "1"=>{"content"=>"Não", "_destroy"=>"0"}, "2"=>{"content"=>"O que é RPG?", "_destroy"=>"0"}, "3"=>{"content"=>"", "_destroy"=>"0"}
          }
        }
      }
    }
  end

  def new_survey_params_error
    { name: nil }
  end

  def update_survey_params
    { name: "Teste rspec Update" }
  end
end
