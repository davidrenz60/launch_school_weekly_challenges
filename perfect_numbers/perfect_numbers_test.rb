require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  def test_zero_raises_error
    assert_raises RuntimeError do
      PerfectNumber.classify(0)
    end
  end

  def test_float_raises_error
    assert_raises RuntimeError do
      PerfectNumber.classify(5.5)
    end
  end

  def test_one_is_deficient
    assert_equal 'deficient', PerfectNumber.classify(1)
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
