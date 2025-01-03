# frozen_string_literal: true
class FightLauncher
  MISSING = 'Missing'
  FIGHT_CLASS = 'Fight'
  STEP_DEEP = 10
  RAW_COMMENT = 'RAW: Battle too long, ended at round:'
  attr_reader :errors

  def initialize(fight:)
    @errors = []
    @errors << "#{MISSING} #{FIGHT_CLASS}" if fight.nil? || fight.class.name != FIGHT_CLASS
    return unless @errors.empty?

    @fight = fight
    @attacker = @fight.attacker.dup
    @defender = @fight.defender.dup
    @step = 0
  end

  def valid?
    @errors << "#{MISSING} player" if @attacker.nil? || @defender.nil?
    @errors.none?
  end

  def launch
    return unless valid?

    while further_steps?
      further_in_fight
      @step += 1
    end
    display_result
  end

  private

  def further_steps?
    players_alive? && @step < STEP_DEEP
  end

  def players_alive?
    @attacker.health_point.positive? && @defender.health_point.positive?
  end

  def further_in_fight
    if @step.odd?
      attacker_takes_damage
    else
      defender_takes_damage
    end
  end

  def attacker_takes_damage
    @attacker.health_point = @attacker.health_point - @defender.attack
  end

  def defender_takes_damage
    @defender.health_point = @defender.health_point - @attacker.attack
  end

  def display_result
    return display_raw if players_alive?

    winner = @attacker.health_point.positive? ? @fight.attacker : @fight.defender
    loser = @attacker.health_point.positive? ? @fight.defender : @fight.attacker
    result = "Results: the player: #{winner.id}:#{winner.name} has defeated #{loser.id}:#{loser.name} in #{@step} rounds"
    @fight.winner_id = winner.id
    @fight.loser_id = loser.id
    @fight.result = result
    update_winner(winner:) if @fight.save
  end

  def display_raw
    @fight.result = "#{RAW_COMMENT} #{@step}"
    @fight.save
  end

  def update_winner(winner:)
    return unless winner

    exp = winner.experience + 10
    winner.update(experience: exp)
    winner.check_level
  end
end
