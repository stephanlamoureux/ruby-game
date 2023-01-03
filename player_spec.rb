require_relative "spec_helper"
require_relative "player"

describe Player do
  before { @player = Player.new("larry", 150) }

  it "has a capitalized name" do
    @player.name.should == "Larry"
    # RSpec 3
    # expect(player.name).to eq("Larry")
  end

  it "has an initial health" do
    @player.health.should == 150
  end

  it "has a string representation" do
    @player.to_s.should == "Larry has 150 health and a score of 155.\n"
  end

  it "computes a score as the sum of its health and length of name" do
    @player.score.should == 155
  end

  it "increases health by 15 when w00ted" do
    @player.w00t

    @player.health.should == 165
  end

  it "decreases health by 10 when blammed" do
    @player.blam

    @player.health.should == 140
  end

  context "with a health greater than 100" do
    before { @player = Player.new("larry", 150) }

    it "is strong" do
      @player.should be_strong
      # shortened version of @player.strong?.should be_strong
    end
  end

  context "with a health equal to 100 or less" do
    before { @player = Player.new("larry", 100) }

    it "is weak" do
      @player.should_not be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end
end
