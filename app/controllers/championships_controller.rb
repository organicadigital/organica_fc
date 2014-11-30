class ChampionshipsController < CrudController
  actions :index, :new, :create

  def create
    create! do |success|
      success.html { redirect_to(controller: :scores, championship_id: resource) }
    end
  end

  private
    def collection
      super.recents
    end

    def permitted_params
      params.permit(championship: [:name])
    end
end