class Plateau
  attr_reader :plateau

  def initialize(plateau = '0 0')
    @plateau = plateau.split.map(&:to_i)
  end

  def in_bounds?(position)
    (0..plateau[0]).include?(position[0]) && (0..plateau[1]).include?(position[1])
  end
end
