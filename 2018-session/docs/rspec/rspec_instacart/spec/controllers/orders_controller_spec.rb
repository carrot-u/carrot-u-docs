require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "#index" do
    let(:customer) { create :customer }
    let(:driver) { create :driver }
    let(:order) { create :order, customer: customer, driver: driver }
    # in this case OrdersController is the implied subject
    it "renders the orders index" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "successfully renders the order show page" do
      get :show, params: { id: order.id }
      expect(response).to have_http_status(200)
    end
  end
end
