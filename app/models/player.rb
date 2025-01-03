# frozen_string_literal: true
class Player < ApplicationRecord
  MAX_STAT_POINTS = 95
  MIN_STAT_POINTS = 10
  MIN_STAT_ERROR = "Any stat can't be below"
  MAX_STAT_ERROR = "All stats can't be above"
  EXPERIENCE_GAP = 30

  validates :name, :health_point, :attack, :dexterity, :intelligence, :level, presence: true
  validate :verify_stats

  def check_level
    return unless level_up?

    self.experience = 0
    self.level += 1
    self.dexterity += rand(1..4)
    self.intelligence += rand(1..4)
    save
  end

  private

  def verify_stats
    stats = [health_point, attack, dexterity, intelligence]
    errors.add(:base, "#{MIN_STAT_ERROR} #{MIN_STAT_POINTS}") if stats.select { |stat| stat < MIN_STAT_POINTS }.any?
    errors.add(:base, "#{MAX_STAT_ERROR} #{MAX_STAT_POINTS}") if stats.inject(:+) > MAX_STAT_POINTS
  end

  def level_up?
    experience > EXPERIENCE_GAP
  end
end
