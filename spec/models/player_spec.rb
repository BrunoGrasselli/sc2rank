require 'spec_helper'

describe Player do
  before :each do
    @body = %{
        <div id='profile-header'>
          <h2>Grasselli</h2>
          <div id="portrait">
            <span style="background: url('/avatar.jpg?v20')">
          </div>
        </div>
        <div class='campaign-casual'><h2>150</h2></div>
    }
  end
  describe '#parse_data' do
    before :each do
      stub_http_request(:get, 'http://userprofile.com').to_return body: @body
      @player = Player.new profile_path: 'http://userprofile.com', initial_points: 149
    end

    it "should update player's wins" do
      @player.wins = nil
      @player.parse_data
      @player.wins.should == 150
    end

    it "should update player's name" do
      @player.name = nil
      @player.parse_data
      @player.name.should == "Grasselli"
    end

    it "should update player's avatar" do
      @player.avatar = nil
      @player.parse_data
      @player.avatar.should == "background: url('http://us.battle.net/avatar.jpg?v20')"
    end
  end

  describe ".update_players!" do
    before :each do
      stub_http_request(:get, 'http://userprofile1.com').to_return body: @body
      stub_http_request(:get, 'http://userprofile2.com').to_return body: @body
      @player_1 = Player.create! profile_path: 'http://userprofile1.com', initial_points: 149
      @player_2 = Player.create! profile_path: 'http://userprofile2.com', initial_points: 149
    end

    it "should parse data and update all players" do
      described_class.update_players!

      players = Player.all
      players.size.should == 2
      players.each {|p| p.name.should == 'Grasselli'}
    end
  end
end
