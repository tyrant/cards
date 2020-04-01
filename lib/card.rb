require_relative './card_number_validator'

class Card

  attr_accessor :card_number

  def initialize(possibly_card_number)
    spaces_removed = possibly_card_number.delete(' ')
    raise ArgumentError.new("Can't contain non-numeric characters") unless CardNumberValidator.numeric_string?(spaces_removed)
    @card_number = spaces_removed
  end

  def validity
    CardNumberValidator.valid?(@card_number) ? 'valid' : 'invalid'
  end

  def type
    if black?
      'Fly Buys Black'
    elsif red?
      'Fly Buys Red'
    elsif green?
      'Fly Buys Green'
    elsif blue?
      'Fly Buys Blue'
    else
      'Unknown'
    end
  end

  def black?
    [16, 17].include?(@card_number.length) && @card_number[0..4] == '60141'
  end

  def red?
    @card_number.length == 16 && @card_number[0..6] == '6014352'
  end

  def green?
    @card_number.length == 16 && 6014355526 <= @card_number[0..9].to_i && @card_number[0..9].to_i <= 6014355529
  end

  def blue?
    @card_number.length == 16 && !black? && !red? && !green? && @card_number[0..3] == '6014'
  end
end