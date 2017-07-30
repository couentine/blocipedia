require 'rails_helper'
RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false) }

  let(:my_user) { FactoryGirl.create(:user, email: "user@blocipedia.com", password: "password") }


  describe "GET #index" do
    it "returns http success" do
      sign_in my_user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      sign_in my_user
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end
    

   describe "DELETE destroy" do
    it "deletes the wiki" do
      sign_in my_user
      delete :destroy, {id: my_wiki.id}

      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq 0
    end

    it "redirects to wiki index" do
      sign_in my_user
      delete :destroy, {id: my_wiki.id}
      expect(response).to redirect_to wikis_path
    end
end
end