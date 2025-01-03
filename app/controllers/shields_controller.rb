# frozen_string_literal: true
class ShieldsController < ItemsController
  before_action :shield, only: %i[show]

  def show; end

  private

  def shield
    @shield = Shield.find_by(id: params[:id])
  end
end
