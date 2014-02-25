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

  def mult(number)
    @total *= number
    return(self)
  end

  def div(number)
    @total /= number
    return(self)
  end

  def sqrt
    @total = Math.sqrt(@total).to_f
    return(self)
  end

end