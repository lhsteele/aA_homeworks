require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("cookie", 35, "lisa") }
  let(:chef) { double("chef") }
  let(:ingredients) do 
    ["flour", "sugar", "butter", "eggs", "vanilla"]
  end
  

  describe "#initialize" do
    it "sets a type" do 
      expect(dessert.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(35)
    end

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to be_empty 
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("cookie", "thirty-five", "lisa") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      expect(dessert.ingredients).to_not include("flour")
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      #dessert.ingredients.stub(:mix).and_return(%w(dessert.ingredients))
      #expect(dessert.mix!).should_receive(:shuffle!).and_return(ingredients.shuffle)
      expect(dessert.mix!).to eq(dessert.ingredients.shuffle)
    end
  end

  
  
  let(:eat_amt) do eat_amt = 10 end
  let(:amount) do amount = 100 end

  describe "#eat" do 
  
    it "subtracts an amount from the quantity" do 
      expect(dessert.quantity - eat_amt).to eq(25)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { dessert.eat(amount) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(dessert.serve).to include("Lisa")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      
    end 
  end
end
