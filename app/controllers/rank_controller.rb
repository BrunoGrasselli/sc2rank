class RankController < ApplicationController
  def index
    @players = Player.all.to_a
    @players.sort! { |a,b| b.rank_wins <=> a.rank_wins }
    @last_update = @players.first.try :updated_at
  end

  def update
    Player.update_players!

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
