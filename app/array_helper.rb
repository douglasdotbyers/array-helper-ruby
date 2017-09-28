class ArrayHelper
  class InvalidArrayError < StandardError
    def initialize(array)
      super("Invalid value for 'array' – '#{array.inspect}'")
    end
  end

  class InvalidPartsError < StandardError
    def initialize(parts)
      super("Invalid value for 'parts' – '#{parts.inspect}'")
    end
  end

  def divide array, parts
    raise InvalidArrayError.new(array) if array.nil?
    raise InvalidPartsError.new(parts) if parts.nil? || parts <= 0

    part_size = get_part_size array.length, parts
    divisions = get_divisions array, parts, part_size
    remainder = get_remainder array, parts, part_size
    divisions.last.push(*remainder)

    divisions
  end

private

  def get_part_size array_length, parts
    part_size = array_length / parts

    part_size += 1 if array_length % parts == parts - 1

    part_size
  end

  def get_divisions array, parts, part_size
    Array.new(parts) { |i| array[(i * part_size)...(i * part_size) + part_size] }
  end

  def get_remainder array, parts, part_size
    array[(parts * part_size)..-1]
  end
end
