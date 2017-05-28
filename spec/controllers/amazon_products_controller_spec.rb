# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AmazonProductsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:amazon_product) { FactoryGirl.create(:amazon_product) }

    it 'returns http success' do
      get :show, params: { id: amazon_product }
      expect(response).to have_http_status(:success)
      expect(assigns(:amazon_product)).to eq(amazon_product)
      expect(assigns(:presenter)).to be_a(AmazonProductPresenter)
    end
  end
end
