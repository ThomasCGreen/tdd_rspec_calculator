require 'rspec'
require './lib/calculator'

describe Calculator do
  describe ".total" do
    it "should return 0 initally" do
      expect(subject.total).to eq(0)
    end
  end

  describe ".add" do
    it "should add a number to the total" do
      subject.add(5)
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to add" do
      subject.add(5).add(2)
      expect(subject.total).to eq(7)
    end

    it "should handle negative numbers" do
      subject.add(-2)
      expect(subject.total).to eq(-2)

      subject.add(5).add(-27).add(10).add(-12)
      expect(subject.total).to eq(-26)
    end

    it "should handle floats" do
      subject.add(2.5)
      expect(subject.total).to eq(2.5)

      subject.add(-3.1).add(4.5).add(-31.257)
      expect(subject.total).to be_within(0.0001).of(-27.357)
    end
  end

  describe ".sub" do
    it "should subtract a number from the total" do
      subject.sub(5)
      expect(subject.total).to eq(-5)
    end

    it "should handle multiple calls to sub" do
      subject.sub(5).sub(2)
      expect(subject.total).to eq(-7)
    end

    it "should handle negative numbers" do
      subject.sub(-2)
      expect(subject.total).to eq(2)

      subject.sub(5).sub(-27).sub(10).sub(-12)
      expect(subject.total).to eq(26)
    end

    it "should handle floats" do
      subject.sub(2.5)
      expect(subject.total).to eq(-2.5)

      subject.sub(-3.1).sub(4.5).sub(-31.257)
      expect(subject.total).to be_within(0.0001).of(27.357)
    end
  end
end
