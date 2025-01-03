# frozen_string_literal: true
class FightsController < ApplicationController
  MAX_FIGHT_LIMIT = 20
  before_action :fight, only: %i[show edit]

  def index
    @fights = Fight.limit(MAX_FIGHT_LIMIT)
  end

  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    if @fight.save
      @fight.launch
      redirect_to :root
    else
      render :new, notice: 'fail'
    end
  end

  def show; end
  def edit; end

  private

  def fight_params
    params.require(:fight).permit(:attacker_id, :defender_id, :attacker_item_id, :defender_item_id)
  end

  def fight
    @fight = Fight.find_by(id: params[:id])
  end
end
