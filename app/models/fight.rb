# frozen_string_literal: true
class Fight < ApplicationRecord
  CANNOT_BE_ALONE_ERROR = "Can't be alone"

  belongs_to :attacker, class_name: 'Player'
  belongs_to :defender, class_name: 'Player'
  belongs_to :attacker_item, class_name: 'Weapon', optional: true
  belongs_to :defender_item, class_name: 'Shield', optional: true
  validates :attacker, :defender, presence: true
  validate :cannot_be_alone

  def launch
    launcher = ::FightLauncher.new(fight: self)
    launcher.launch if launcher.valid?
  end

  private

  def cannot_be_alone
    errors.add(:base, CANNOT_BE_ALONE_ERROR) if attacker_id == defender_id
  end
end
