class Rotor
  def self.alphabet(mapping)
    new(mapping)
  end

  def initialize(mapping)
    @right = mapping.scan(/./)
    @left = ('A'..'Z').to_a
    @offset = 0
  end

  def at(letter)
    @offset = @left.index(letter)
    self
  end

  def output(index)
    requested_letter = @left[apply_offset(index)]
    remove_offset(@right.index(requested_letter))
  end

  def input(index)
    requested_letter = @right[apply_offset(index)]
    remove_offset(@left.index(requested_letter))
  end

  private
  def apply_offset(value)
    (@offset + value) % @left.length
  end

  def remove_offset(value)
    (value - @offset) % @left.length
  end

  I =   alphabet('EKMFLGDQVZNTOWYHXUSPAIBRCJ')
  II =  alphabet('AJDKSIRUXBLHWTMCQGZNPYFVOE')
  III = alphabet('BDFHJLCPRTXVZNYEIWGAKMUSQO')
end
