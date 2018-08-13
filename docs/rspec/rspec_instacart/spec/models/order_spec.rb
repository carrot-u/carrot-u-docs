require 'rails_helper'

describe Order do
  let(:customer) { create :customer }
  let(:driver) { create :driver }
  # because the order model references customer/driver, we need those records to exist, and can call the full object in the next line
  let(:order) { create :order, customer: customer, driver: driver }

  describe "validations" do
    subject { order }

    context "when the order has the necessary attributes" do
      # in this case we are ensuring everything is included in the order factory
      it { is_expected.to be_valid }
    end

    context "when the order does not have items" do
      before { order.update(items: []) }
      # our order example has items, so we need to clear them first
      it { is_expected.not_to be_valid }
    end

    context "when the order does not have a warehouse" do
      before { order.update(warehouse: nil) }
      it { is_expected.not_to be_valid }
    end
  end

  describe ".advance_to_next_stage" do
    before { order.advance_to_next_stage }

    context "when the order is brand new" do
      it "will move the order workflow_state to shopping" do
        expect(order.workflow_state).to eq "shopping"
      end
    end

    context "when the order is shopping" do
      # what should happen?
    end

    context "when the order is delivered" do
      # what should happen?
    end
  end
end

