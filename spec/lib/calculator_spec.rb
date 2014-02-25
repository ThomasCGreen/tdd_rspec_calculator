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

  describe ".mult" do
    it "should multiply a number from the total" do
      subject.add(5).mult(4)
      expect(subject.total).to eq(20)

      subject.mult(1)
      expect(subject.total).to eq(20)

      subject.mult(0)
      expect(subject.total).to eq(0)
    end

    it "should handle multiple calls to mult" do
      subject.add(5).mult(2).mult(3)
      expect(subject.total).to eq(30)
    end

    it "should handle negative numbers" do
      subject.add(-2).mult(4)
      expect(subject.total).to eq(-8)

      subject.add(5).mult(-27).mult(10).mult(-12)
      expect(subject.total).to eq(-9720)
    end

    it "should handle floats" do
      subject.add(2.5).mult(-2.5)
      expect(subject.total).to eq(-6.25)

      subject.mult(4.5).mult(-31.257)
      expect(subject.total).to be_within(0.0001).of(879.1031)
    end
  end

  describe ".div" do
    it "should divide a number from the total" do
      subject.add(20).div(4)
      expect(subject.total).to eq(5)

      subject.div(1)
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to div" do
      subject.add(40).div(2).div(5)
      expect(subject.total).to eq(4)
    end

    it "should handle negative numbers" do
      subject.sub(200).div(4)
      expect(subject.total).to eq(-50)

      subject.div(-2).div(5)
      expect(subject.total).to eq(5)
    end

    it "should handle floats" do
      subject.add(5.0).div(-2.5)
      expect(subject.total).to eq(-2.0)

      subject.div(0.5).div(-0.25)
      expect(subject.total).to be_within(0.0001).of(16.000)
    end

    it "should have exception with divide by zero" do
      expect { subject.div(0) }.to raise_error(ZeroDivisionError)
    end
  end

  describe ".sqrt" do
    it "should take the root a number from the total" do
      expect(subject.sqrt.total).to eq(0.0)

      subject.add(25).sqrt
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to sqrt" do
      subject.add(256).sqrt.sqrt
      expect(subject.total).to eq(4)
    end

    it "should have exception for negative square roots" do
      expect {subject.sub(16).sqrt.total}.to raise_error(Math::DomainError)
    end

    it "should handle floats" do
      subject.add(3.0).sqrt
      expect(subject.total).to be_within(0.001).of(1.732)
    end
  end
end
