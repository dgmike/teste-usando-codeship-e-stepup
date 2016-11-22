require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    it 'must get index page' do
      get :index
      expect(response).to be_success
      expect(assigns(:name)).to eq('Marcelo')
    end

    it 'must get index page with Michael' do
      get :index, params: { name: 'Michael' }
      expect(assigns(:name)).to eq('Michael')
    end

    it 'must get index page with Bulma' do
      get :index, params: { name: 'Bulma' }
      expect(assigns(:name)).to eq('Bulma')
    end
  end

  describe '#create' do
    it 'must set action' do
      get :create
      expect(response).to be_success
      expect(assigns(:action)).to eq('calc')
      expect(assigns(:calc)).to eq(2)
    end
  end
end
