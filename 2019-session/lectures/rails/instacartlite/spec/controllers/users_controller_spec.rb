require 'rails_helper'

RSpec.describe UsersController, type: :controller do 
  render_views

  describe "#index" do
    subject { get :index }

		it "works" do
			get :index

      expect(response).to render_template(:index)
      expect(response.body).to include('Users')
      expect(response.body).to include('Email')
    end		
    
    it { is_expected.to have_http_status :ok }

    it { is_expected.to_not have_http_status :not_found }
  end
  
  describe "#show" do
    let!(:user) { User.create!(
        first_name: "Viktor", 
        email: "viktor@instacart.com", 
        password: "password" 
    )}

    it "users email present on the page" do
      get :show, params: { id: user.id }
      expect(response.body).to include(user.email)
    end

    it "renders shgow template" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end    
  end

  describe "#create" do

    subject { post :create, params: params }

    let(:params) { { 
      user: { 
        email: 'viktor@instacart.com',
        first_name: 'viktor', 
        password: 'password' 
        } 
      }
    }

    context "user properties were valid" do
      before do
        expect_any_instance_of(User).to receive(:save).and_call_original        
      end

      it "creates user " do
        post :create, params: params
        user = User.last
        expect(user.first_name).to eq('Viktor')        
      end

      it "redirects to new user" do
        post :create, params: params
        expect(response).to redirect_to("/users/#{assigns(:user).id}")
      end
    end

    context "user has no email" do
      # let(:new_user) { User.new last_name: 'Jonson', first_name: "Mike" }
      
      subject { post :create, params: params , format: :json }

      let(:params) { { 
        user: {           
          first_name: 'viktor', 
          password: 'password' 
          } 
        }
      }

      before do
        expect_any_instance_of(User).to receive(:save).and_call_original
        # allow(User).to receive(:new).and_return(new_user)
      end    
     
      it { is_expected.to have_http_status :unprocessable_entity }

    end
  end


end


# subject { get :index }

		# it { is_expected.to have_http_status :ok }

		# it { is_expected.to render_template :index }	