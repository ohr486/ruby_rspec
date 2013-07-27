# -*- encoding: utf-8 -*-

class VendingMachine
  attr_accessor :amount

  def initialize
    @amount = 0
  end

  def insert(money)
    @amount += money
  end

  def refund
    change = @amount
    @amount = 0
    change
  end
end
