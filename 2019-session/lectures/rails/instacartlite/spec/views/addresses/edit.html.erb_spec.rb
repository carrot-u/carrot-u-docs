require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :user => nil,
      :street => "MyText",
      :city => "MyText",
      :state => "MyText",
      :zip_code => "MyText",
      :active => false
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[user_id]"

      assert_select "textarea[name=?]", "address[street]"

      assert_select "textarea[name=?]", "address[city]"

      assert_select "textarea[name=?]", "address[state]"

      assert_select "textarea[name=?]", "address[zip_code]"

      assert_select "input[name=?]", "address[active]"
    end
  end
end
