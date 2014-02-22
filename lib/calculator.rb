class Calculator

  def initialize
    @total = 0
  end

  def total
    @total
  end

  def add(number)
    @total += number
    return(self)
  end

  def sub(number)
    @total -= number
    return(self)
  end
end