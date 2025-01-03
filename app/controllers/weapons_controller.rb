# frozen_string_literal: true
class WeaponsController < ItemsController
  before_action :weapon, only: %i[show]

  def show; end

  private

  def weapon
    @weapon = Weapon.find_by(id: params[:id])
  end
end
