# frozen_string_literal: true
class ItemsController < ApplicationController
  MAX_ITEM_LIMIT = 10

  def index
    @weapons = Weapon.limit(MAX_ITEM_LIMIT)
    @shields = Shield.limit(MAX_ITEM_LIMIT)
  end
end
