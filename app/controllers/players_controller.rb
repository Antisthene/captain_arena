# frozen_string_literal: true
class PlayersController < ApplicationController
  MAX_PLAYER_LIMIT = 20
  before_action :player, only: %i[show edit update delete]

  def index
    @players = Player.limit(MAX_PLAYER_LIMIT)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player), notice: 'success'
    else
      render :new, notice: 'fail'
    end
  end

  def update
    if @player.update(player_params)
      redirect_to player_path(@player), notice: 'success'
    else
      render :edit, id: @player.id, notice: 'fail'
    end
  end

  def edit; end
  def show; end

  def delete
    @player&.destroy
  end

  private

  def player
    @player = Player.find_by(id: params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :attack, :dexterity, :intelligence, :health_point)
  end
end
