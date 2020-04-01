require_relative '../lib/card_number_validator'
require 'test/unit'

class CardNumberValidatorTest < Test::Unit::TestCase

  def tests
    assert_true CardNumberValidator.valid?('60141016700078611')
    assert_false CardNumberValidator.valid?('6014152705006141')
    assert_true CardNumberValidator.valid?('6014111100033006')
    assert_true CardNumberValidator.valid?('6014709045001234')
    assert_true CardNumberValidator.valid?('6014352700000140')
    assert_true CardNumberValidator.valid?('6014355526000020')
    assert_false CardNumberValidator.valid?('6014 3555 2900 0028')
    assert_false CardNumberValidator.valid?('6013111111111111')
  end
end