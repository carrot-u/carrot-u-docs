require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  describe '#index' do
    subject { get :index }

    it 'is expected to render text "Groceries delivered"' do
      subject
      expect(response.body).to include('Groceries delivered in as lite-le as 1 hour')
    end

    it { is_expected.to have_http_status :ok }
    it { is_expected.to render_template :index }
  end
end
