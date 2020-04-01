require_relative '../lib/sanity_check'
require 'test/unit'

class SanityCheckTest < Test::Unit::TestCase

  def test_example_gist
    numbers = <<~EOS
      60141016700078611
      6014152705006141
      6014111100033006
      6014709045001234
      6014352700000140
      6014355526000020
      6014 3555 2900 0028
      6013111111111111
    EOS

    sc = SanityCheck.new(numbers)

    expected_output = <<~EOS
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Black: 6014111100033006 (valid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Red: 6014352700000140 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Fly Buys Green: 6014355529000028 (invalid)
      Unknown: 6013111111111111 (invalid)
    EOS
    expected_output.strip!

    assert_equal(expected_output, sc.perform_checks)
  end

  def test_partly_bad_input
    numbers = <<~EOS
      60141016700078611
      6014152705006141
      aenoi4f40f40f4oifj4
      6014709045001234
      on5o34nf80j4r
      6014355526000020
      ionio2ioio43n
      6013111111111111
    EOS

    sc = SanityCheck.new(numbers)

    expected_output = <<~EOS
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Unknown: 6013111111111111 (invalid)

      Error with aenoi4f40f40f4oifj4: Can't contain non-numeric characters
      Error with on5o34nf80j4r: Can't contain non-numeric characters
      Error with ionio2ioio43n: Can't contain non-numeric characters
    EOS
    expected_output.strip!

    assert_equal(expected_output, sc.perform_checks)
  end

  def test_non_numeric_input
    assert_raise ArgumentError.new("Oh come on, stop messing around") do
      SanityCheck.new(60141016700078611)
    end
  end


end
