# frozen_string_literal: true
class PagesController < ApplicationController
  def index
    @last_fight = Fight.last
  end
end
