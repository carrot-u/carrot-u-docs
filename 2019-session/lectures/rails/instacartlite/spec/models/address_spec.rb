require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "create" do
    context "user has no addresses" do
      it "user has 1 address" do
        u = User.create(first_name: "mario", email: "mario@ninten.do", password: "password")
        a = Address.create(user: u, street: "123 main")
        expect(u.addresses.count).to eq(1)
      end
    end

    context "user has 1 address" do
      it "user has 1 address" do
        u = User.create(first_name: "mario", email: "mario@ninten.do", password: "password")
        a = Address.create(user: u, street: "123 main", active: true)
        a2 = Address.create(user: u, street: "123new main", active: true)
        expect(u.addresses.count).to eq(2)
        expect(a.reload.active).to eq(false)
        # binding.pry
        expect(u.addresses.active.count).to eq(1)
      end
    end

    context "user has 2 address" do

    end
  end
end
