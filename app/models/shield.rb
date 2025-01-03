# frozen_string_literal: true
class Shield < ApplicationRecord
  validates :name, :defense, presence: true
end
