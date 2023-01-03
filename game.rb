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

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong_player, weak_player = @players.partition { |player| player.strong? }

    puts "\n#{@title} statistics:"

    puts "\n#{strong_player.length} strong player(s)."
    strong_player.sort.each { |player| print_name_and_health(player) }

    puts "\n#{weak_player.length} weak player(s)."
    weak_player.sort.each { |player| print_name_and_health(player) }

    puts "\n#{title} High Scores:"
    @players.sort.each do |player|
      puts "#{player.name.ljust(20, ".")} #{player.score}"
    end
  end

  def play(rounds)
    puts "There are #{@players.size} player(s) in #{@title}:\n "

    @players.each { |player| puts player }

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        TakeTurn.new_turn(player)
        puts player
      end
    end
  end
end
