def time
  current_time = Time.new
  current_time.strftime("%I:%M:%S")
end

class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score} as of #{time}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @health += @name.length
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

puts player1
puts player2
puts player3
player3.blam
puts player3
player3.w00t
puts player3
puts player1.health
player2.name = "Lawrence"
puts player2.name
player3.name = "kurly"
puts player3.name
