# -*- encoding: utf-8 -*-

class VendingMachine
  attr_accessor :amount, 
    :count_of_y10,  :count_of_y50,  :count_of_y100,
    :count_of_y500, :count_of_y1000

  def initialize
    @amount = 0
    @count_of_y10   = 0
    @count_of_y50   = 0
    @count_of_y100  = 0
    @count_of_y500  = 0
    @count_of_y1000 = 0
  end

  def stock_money(money)
    @amount += money
  end

  [10, 50, 100, 500, 1000].each do |money|
    define_method("insert#{money}") do
      stock_money(money)
    end
  end

  def refund
    change = @amount
    @amount = 0
    change
  end
end
