# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

attacker = Player.find_or_create_by(name: 'Bob', dexterity: 17)
defender = Player.find_or_create_by(name: 'Zork', intelligence: 17)
fight = Fight.new(attacker: , defender:)
fight.launch
Shield.find_or_create_by(name: 'Wooden Shield', defense: 2)
Weapon.find_or_create_by(name: 'Rusty axe', damage: 5, require_dexterity: 12)
Weapon.find_or_create_by(name: 'Wand', damage: 7, require_intelligence: 15)
