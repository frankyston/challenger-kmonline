require 'rails_helper'

RSpec.describe Admin::HomeController, type: :request do
  let!(:user) { create(:user, :admin) }
  before { sign_in user }

  describe  "GET #index" do
    it "returns http success" do
      get admin_root_url
      expect(response).to have_http_status(:success)
    end
  end
end
