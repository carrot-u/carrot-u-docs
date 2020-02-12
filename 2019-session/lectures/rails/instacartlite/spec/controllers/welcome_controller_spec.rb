require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  describe ".current_user" do

  end

  describe '#index' do
    subject { get :index }

    let!(:user) { FactoryBot.build :user }

    it 'is expected to render text "Groceries delivered"' do
      subject
      expect(response.body).to include('Groceries delivered in as lite-le as 1 hour')
      expect(response.status).to eq(200)
      expect(response.status).to_not eq(400)
    end

    it { is_expected.to have_http_status :ok }

    it { is_expected.to render_template :index }

    context "when user is logged in" do

    end

    context "when user is logged out" do

    end


  end
end
