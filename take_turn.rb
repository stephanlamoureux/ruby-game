require_relative "player"
require_relative "die"

module TakeTurn
  def self.new_turn(player)
    die = Die.new

    case die.roll
    when 1..2
      player.blam
    when 3..4
      puts "\n#{player.name} was skipped."
    else
      player.w00t
    end
  end
end
