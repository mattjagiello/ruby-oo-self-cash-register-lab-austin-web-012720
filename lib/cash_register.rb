require 'pry'

class CashRegister
  attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_price
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @title = title
    @items = []
  end
  def total
    @total
  end
  def add_item(title, price, quantity = 0)
    @title = title
    @price = price
    @last_price = price
    @quantity = quantity
    if @quantity > 0
    self.total = @total + (@price * @quantity)
      @quantity.times do
        @items << @title
      end
    else
    self.total = @total + @price
    @items << @title
    end
  end
  def apply_discount
    self.total = @total * (@discount * 0.04)
    if @discount == 0
      return "There is no discount to apply."
    else
    return "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  def void_last_transaction
    self.total = @total - @last_price
    if @items != []
      @quantity.times do
        @items.pop
        if @items == []
          @total = 0
        end
      end
    end
  end
end
