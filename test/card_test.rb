require_relative '../lib/card'
require 'test/unit'

class CardTest < Test::Unit::TestCase

  def test_card1
    number1 = '60141016700078611'
    card1 = Card.new(number1)
    assert_equal(card1.card_number, number1)
    assert_equal('Fly Buys Black', card1.type)
    assert_true(card1.black?)
    assert_equal('valid', card1.validity)
  end

  def test_card2
    number2 = '6014152705006141'
    card2 = Card.new(number2)
    assert_equal(card2.card_number, number2)
    assert_equal('Fly Buys Black', card2.type)
    assert_true(card2.black?)
    assert_equal('invalid', card2.validity)
  end

  def test_card3
    number3 = '6014111100033006'
    card3 = Card.new(number3)
    assert_equal(card3.card_number, number3)
    assert_equal('Fly Buys Black', card3.type)
    assert_true(card3.black?)
    assert_equal('valid', card3.validity)
  end

  def test_card4
    number4 = '6014709045001234'
    card4 = Card.new(number4)
    assert_equal(card4.card_number, number4)
    assert_equal('Fly Buys Blue', card4.type)
    assert_true(card4.blue?)
    assert_equal('valid', card4.validity)
  end

  def test_card5
    number5 = '6014352700000140'
    card5 = Card.new(number5)
    assert_equal(card5.card_number, number5)
    assert_equal('Fly Buys Red', card5.type)
    assert_true(card5.red?)
    assert_equal('valid', card5.validity)
  end

  def test_card6
    number6 = '6014355526000020'
    card6 = Card.new(number6)
    assert_equal(card6.card_number, number6)
    assert_equal('Fly Buys Green', card6.type)
    assert_true(card6.green?)
    assert_equal('valid', card6.validity)
  end

  def test_card7
    number7 = '6014 3555 2900 0028'
    card7 = Card.new(number7)
    assert_equal(number7.delete(' '), card7.card_number)
    assert_equal('Fly Buys Green', card7.type)
    assert_true(card7.green?)
    assert_equal('invalid', card7.validity)
  end

  def test_card8
    number8 = '6013111111111111'
    card8 = Card.new(number8)
    assert_equal(number8, card8.card_number)
    assert_equal('Unknown', card8.type)
    assert_equal('invalid', card8.validity)
  end

  def test_card9
    assert_raise ArgumentError.new("Can't contain non-numeric characters") do
      Card.new('blargh bad value')
    end
  end
end