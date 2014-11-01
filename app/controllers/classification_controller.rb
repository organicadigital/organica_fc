class ClassificationController < ApplicationController
  def index
    @scores = Score.includes(:player).all.sorted
  end
end