require "minitest/autorun"

require_relative "../app/array_helper"

class ArrayHelperTest < Minitest::Test
  def setup
    @array_helper = ArrayHelper.new
  end

  def teardown
    @array_helper = nil
  end

  def test_divide_with_nil_array_raises_invalid_array_error
    # Arrange.
    array = nil
    parts = 3

    # Act.
    error = assert_raises ArrayHelper::InvalidArrayError do
      @array_helper.divide(array, parts)
    end

    # Assert.
    assert_equal "Invalid value for 'array' – 'nil'", error.message
  end

  def test_divide_with_nil_parts_raises_invalid_parts_error
    # Arrange.
    array = [1, 2, 3]
    parts = nil

    # Act.
    error = assert_raises ArrayHelper::InvalidPartsError do
      @array_helper.divide(array, parts)
    end

    # Assert.
    assert_equal "Invalid value for 'parts' – 'nil'", error.message
  end

  def test_divide_with_zero_parts_raises_invalid_parts_error
    # Arrange.
    array = [1, 2, 3]
    parts = 0

    # Act.
    error = assert_raises ArrayHelper::InvalidPartsError do
      @array_helper.divide(array, parts)
    end

    # Assert.
    assert_equal "Invalid value for 'parts' – '0'", error.message
  end

  def test_divide_with_less_than_zero_parts_raises_invalid_parts_error
    # Arrange.
    array = [1, 2, 3]
    parts = -1

    # Act.
    error = assert_raises ArrayHelper::InvalidPartsError do
      @array_helper.divide(array, parts)
    end

    # Assert.
    assert_equal "Invalid value for 'parts' – '-1'", error.message
  end

  def test_divide_with_empty_array_and_3_parts_returns_array_with_3_parts
    # Arrange.
    array           = []
    parts           = 3
    expected_result = [[], [], []]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_1_part_returns_array_with_1_part_and_no_remainder
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 1
    expected_result = [[1, 2, 3, 4, 5, 6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_2_parts_returns_array_with_2_equal_sized_parts_and_no_remainder
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 2
    expected_result = [[1, 2, 3], [4, 5, 6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_3_parts_returns_array_with_3_equal_sized_parts_and_no_remainder
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 3
    expected_result = [[1, 2], [3, 4], [5, 6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_4_parts_returns_array_with_3_equal_sized_parts_and_remainder_of_length_3
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 4
    expected_result = [[1], [2], [3], [4, 5, 6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_5_parts_returns_array_with_4_equal_sized_parts_and_remainder_of_length_2
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 5
    expected_result = [[1], [2], [3], [4], [5, 6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_6_and_6_parts_returns_array_with_6_equal_sized_parts_and_no_remainder
    # Arrange.
    array           = [1, 2, 3, 4, 5, 6]
    parts           = 6
    expected_result = [[1], [2], [3], [4], [5], [6]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end

  def test_divide_with_array_of_length_5_and_3_parts_returns_array_with_2_equal_sized_parts_and_remainder_of_length_1
    # Arrange.
    array           = [1, 2, 3, 4, 5]
    parts           = 3
    expected_result = [[1, 2], [3, 4], [5]]

    # Act.
    actual_result = @array_helper.divide(array, parts)

    # Assert.
    assert_equal expected_result, actual_result
  end
end
