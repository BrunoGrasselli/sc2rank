class RankController < ApplicationController
  def index
    @players = Player.all
  end
end
