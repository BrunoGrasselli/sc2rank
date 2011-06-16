require 'spec_helper'

describe Player do
  describe '#get_data' do
    before :each do
      body = %{
        <div class='campaign-casual'>
          <h2>150</h2>
        </div>
      }
      stub_http_request(:get, 'http://userprofile.com').to_return body: body

      @player = Player.new profile_path: 'http://userprofile.com', initial_points: 149
    end

    it "should update player wins" do
      @player.wins = nil
      @player.get_data
      @player.wins.should == 150
    end
  end
end
