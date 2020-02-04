require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
	render_views

	describe "#index" do

		it "works" do
			get :index
			expect(response.body).to include "Groceries" #("Groceries delivered in as lite-le as 1 hour")

			# have_content("")
		end
	end

end
