require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      # expect(brownie.quantity).should eq(100) # actually gives deprecation(!)
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      # expect(brownie.ingredients).to eq([]) # is it bad form, or an option
      expect(brownie.ingredients).to be_empty # to not use a matcher?
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("Sennacy's catfood and Markov's hairball.")
      expect(brownie.ingredients).to include("Sennacy's catfood and Markov's hairball.")

    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
     ingredients = ["Sennacy's catfood", "Markov's hairball", "Luna's dogfood", "Used Folgers grounds", "Nice!-brand saltines"]
     ingredients.each {|ingredient| brownie.add_ingredient(ingredient)}
     brownie.mix!
     expect(brownie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    expect(brownie.eat(-10)).to eq(110) #.unshift some undercooked brownies ; )
    end


    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat((2**(0.size * 8 - 2) -1))}.to raise_error("not enough left!")
      # ruby on mac mini can eay a lot of brownies....
    end
  end
end
