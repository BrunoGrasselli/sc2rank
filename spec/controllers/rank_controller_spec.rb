require 'spec_helper'

describe RankController do
  describe "GET index" do
    before :each do
      @players = [mock(updated_at: 'time')]
      Player.stub(:all).and_return @players
    end

    after :each do
      Player.unstub :all
    end

    it "should assign all players to @players" do
      get :index
      assigns[:players].should == @players
    end

    it "should assign last update" do
      get :index
      assigns[:last_update].should == 'time'
    end
  end

  describe "GET update" do
    before :each do
      Player.stub :update_players!
    end

    it "should call Player.update_all" do
      Player.should_receive :update_players!
      put :update
    end

    it "should redirect to index" do
      put :update
      response.should redirect_to '/'
    end
  end
end
