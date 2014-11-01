class GamesController < ApplicationController
  def index
    @games_table = GamesTable.new
  end

  def new
    @game = Game.new permitted_params
  end

  def create
    @game = Game.new permitted_params

    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  private
    def players
      @players ||= Player.all
    end

    def permitted_params
      params.permit(game: [:home_player_id, :away_player_id, :home_goals, :away_goals])[:game]
    end

    helper_method :players
end