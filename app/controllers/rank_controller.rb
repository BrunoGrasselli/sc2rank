class RankController < ApplicationController
  def index
    @players = Player.all
    @last_update = @players.first.try :updated_at
  end

  def update
    Player.update_all

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
