require_relative "menu"
require_relative "order"

class Interface

  def initialize(options_hash)
    puts "Welcome to TexasTacos, y'all!"
    @menu = options_hash.fetch(:menu, Menu.new)
    @order_class = options_hash.fetch(:order, Order)
    @current_order = nil
  end

  def show_menu
    @menu.show_menu
  end

  def new_order
    @current_order = @order_class.new(@menu)
  end

  def order(item = nil, quantity = 1)
    current_order?
    @current_order.add_to_order(item, quantity)
  end

  def review_order
    current_order?
    @current_order.review_order
  end

  def checkout(payment_amount = 0)
    current_order?
    @current_order.checkout(payment_amount)
    @current_order = nil
  end

  private

  def current_order?
    raise "Please begin your order" if @current_order.nil?
  end
end