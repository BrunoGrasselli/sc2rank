require 'spec_helper'

describe Admin::PlayersController do
  include Devise::TestHelpers

  before(:each) do
    @user = User.create! :login => "dynaum", :password => "123456", :password_confirmation => "123456", :email => "foo@bar.com"
    sign_in @user
  end

  it { should be_a AdminController }

  describe "PUT reset_wins" do
    before :each do
      Player.stub :reset_wins!
    end

    it "should call Player.reset_wins" do
      Player.should_receive :reset_wins!
      put :reset_wins
    end

    it "should redirect to admin index" do
      put :reset_wins
      response.should redirect_to admin_path
    end
  end
end
