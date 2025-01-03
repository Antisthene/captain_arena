# frozen_string_literal: true
class WeaponsController < ItemsController
  before_action :weapon, only: %i[show]

  def new
    @weapon = Weapon.new
  end

  def create
    @weapon = Weapon.new(weapon_params)
    if @weapon.save
      redirect_to weapon_path(@weapon), notice: 'success'
    else
      render :new, notice: 'fail'
    end
  end

  def show; end

  private

  def weapon
    @weapon = Weapon.find_by(id: params[:id])
  end

  def weapon_params
    params.require(:weapon).permit(:damage, :name)
  end
end
