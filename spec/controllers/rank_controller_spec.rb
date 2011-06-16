require 'spec_helper'

describe RankController do
  describe "GET index" do
    it "should assign all players to @players" do
      players = mock
      Player.stub(:all).and_return players

      get :index
      assigns[:players].should == players

      Player.unstub(:all)
    end
  end
end
