# frozen_string_literal: true
class Weapon < ApplicationRecord
  validates :name, :damage, presence: true
end
