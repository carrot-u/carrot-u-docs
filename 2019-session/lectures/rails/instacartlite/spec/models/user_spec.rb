require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#normalize_name" do
    shared_examples "normalize name" do |first_name|
      it "normalize first_name #{first_name} to 'Viktor'" do
        user = User.create!(
          first_name: first_name,
          password: 'password',
          email: 'viktor@instacart.com'
        )

        expect(user.first_name).to eq("Viktor")
      end
    end

    it_behaves_like "normalize name", "Viktor"
    it_behaves_like "normalize name", "viktor"
    it_behaves_like "normalize name", "VIKTOR"
    it_behaves_like "normalize name", "vIKtor"
  end

end