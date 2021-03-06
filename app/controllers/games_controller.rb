class GamesController < CrudController
  belongs_to :championship

  actions :index, :edit, :update

  def cancel
    resource.cancel!
    redirect_to action: :index
  end

  def update
    update! do |success, error|
      success.html { redirect_to action: :index }
      error.html
    end
  end

  private
    def end_of_association_chain
      super.ordered.includes(:home_score, :away_score)
    end

    def scores
      @scores ||= parent.scores.name_order
    end

    helper_method :scores


    def permitted_params
      params.permit(game: [:home_goals, :away_goals, :game_date])
    end
end