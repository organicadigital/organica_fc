class ScoresController < CrudController
  belongs_to :championship

  actions :all, except: [:destroy, :show]

  def create
    create! do |success, error|
      success.html { redirect_to action: :index }
      error.html
    end
  end

  def update
    update! do |success, error|
      success.html { redirect_to action: :index }
      error.html
    end
  end

  private
    def collection
      super.sorted.all
    end

    def permitted_params
      params.permit(score: [:team_name, :team_logo, {player_ids: []}])
    end

    def players
      @players ||= Player.sorted.all
    end

    helper_method :players
end