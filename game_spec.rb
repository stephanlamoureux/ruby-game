require_relative "spec_helper"
require_relative "game"

describe Game do
  before do
    @game = Game.new("Knuckleheads")
    @initial_health = 100
    @player = Player.new("moe", @initial_health)

    @game.add_player(@player)
  end

  it "has a title" do
    @game.title.should == "Knuckleheads"
  end

  it "w00ts player with a roll of 5 or 6" do
    Die.any_instance.stub(:roll).and_return(5)
    # RSpec 3
    # allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @game.play(2)

    @player.health.should == @initial_health + (15 * 2)
  end

  it "skips a player with a roll of 3" do
    Die.any_instance.stub(:roll).and_return(3)

    @game.play(2)

    @player.health.should == @initial_health
  end

  it "blams the player if a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)

    @game.play(2)

    @player.health.should == @initial_health - (10 * 2)
  end
end
