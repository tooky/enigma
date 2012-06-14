class Reflector
  attr_reader :reflections
  def initialize
    @reflections = 'ABCDEFGDIJKGMKMIEBFTCVVJAT'.scan(/./)
  end

  def reflect(index)
    letter = reflections[index]

    reflections.each_with_index do |c,i|
      return i if c == letter && i != index
    end
  end
end
