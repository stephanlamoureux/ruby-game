class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "#{@name} has #{@health} health and a score of #{score}.\n"
  end

  def <=>(other)
    other.score <=> score
  end

  def blam
    @health -= 10
    puts "\n#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "\n#{@name} got w00ted!"
  end

  def score
    @health + @name.length
  end

  def strong?
    @health > 100
  end
end

# example code
# this will only ran if player.rb is executed directly

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
