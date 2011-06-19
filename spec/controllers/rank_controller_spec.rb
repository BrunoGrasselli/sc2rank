require 'spec_helper'

describe RankController do
  describe "GET index" do
    it "should assign all players to @players ordered by wins" do
      Player.destroy_all

      Player.create! :name => "QA", :initial_points => 0, :wins => 5
      Player.create! :name => "Bruno", :initial_points => 0, :wins => 10

      get :index
      assigns[:players].map(&:name).should == ["Bruno", "QA"]
    end

    it "should assign last update" do
      @players = [mock(updated_at: 'time', rank_wins: 10)]
      Player.stub(:all).and_return @players

      get :index
      assigns[:last_update].should == 'time'

      Player.unstub :all
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
