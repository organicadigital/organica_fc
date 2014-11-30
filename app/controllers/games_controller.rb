class GamesController < CrudController
  belongs_to :championship

  actions :index, :edit, :update

  def update
    update! do |success, error|
      success.html { redirect_to action: :index }
      error.html
    end
  end

  private
    def collection
      super.ordered
    end

    def permitted_params
      params.permit(game: [:home_goals, :away_goals, :game_date])
    end
end