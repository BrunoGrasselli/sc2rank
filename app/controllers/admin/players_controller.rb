class Admin::PlayersController < AdminController
  def reset_wins
    Player.reset_wins!

    respond_to do |format|
      format.html { redirect_to admin_path }
    end
  end
end
