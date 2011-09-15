class Admin::PlayersController < AdminController
  def reset_wins
    flash[:notice] = "Rank zerado" if Player.reset_wins!
    respond_to do |format|
      format.html { redirect_to admin_path }
    end
  end
end
