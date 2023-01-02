require_relative "player"
require_relative "die"
require_relative "take_turn"

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(new_player)
    @players.push(new_player)
  end

  def play
    puts "There are #{@players.size} players in #{@title}: "

    @players.each { |player| puts player }

    @players.each do |player|
      TakeTurn.new_turn(player)
      puts player
    end
  end
end
