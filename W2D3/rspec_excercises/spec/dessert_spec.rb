require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements
without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ryan") }
  let(:ice_cream) { Dessert.new("cold cream", 50, "Ryan")}

  describe "#initialize" do
    it "sets a type" do
      expect(ice_cream.type).to eq("cold cream")
    end

    it "sets a quantity" do
      expect(ice_cream.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(ice_cream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("apples", "bunch", "Zach")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      ice_cream.add_ingredient("mint")
      expect(ice_cream.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ice_cream.add_ingredient("mint")
      ice_cream.add_ingredient("chocoloate")
      ice_cream.add_ingredient("almonds")
      ice_cream.add_ingredient("cream")
      expect(ice_cream.ingredients).to eq(["mint", "chocoloate", "almonds", "cream"])
      expect(ice_cream.mix!).not_to eq(["mint", "chocoloate", "almonds", "cream"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      ice_cream.eat(10)
      expect(ice_cream.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ ice_cream.eat(51)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ryan the Great Baker")
      expect(ice_cream.serve).to eq("Chef Ryan the Great Baker has made 50 cold creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(ice_cream)
      ice_cream.make_more
    end
  end
end
