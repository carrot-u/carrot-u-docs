require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :user => nil,
        :street => "MyText",
        :city => "MyText",
        :state => "MyText",
        :zip_code => "MyText",
        :active => false
      ),
      Address.create!(
        :user => nil,
        :street => "MyText",
        :city => "MyText",
        :state => "MyText",
        :zip_code => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
