class Rover
  MAIN_DIRECTIONS = %w[S W N E].freeze
  attr_reader :plateau, :start_position, :rover_command, :direction, :position

  def initialize(plateau, position, commands)
    @direction = position.split[2]
    @position = position.split.first(2).map(&:to_i)
    @plateau = plateau.split.map(&:to_i)
    @commands = commands
    @move_namber = 0
  end

  def print_info
    @commands.each_char do |command|
      @move_namber += 1
      action(command)
    end
    print "final position x: #{position[0]} y: #{position[1]} facing to: "
    case direction
    when 'N'
      print "North\n"
    when 'S'
      print "South\n"
    when 'E'
      print "East\n"
    when 'W'
      print "West\n"
    end
  end

  private

  def action(command)
    case command.upcase
    when 'R'
      turn_right
    when 'L'
      turn_left
    when 'M'
      move
    else
      p "Wrong input: #{command}"
    end
  end

  def turn_right
    curent_index = MAIN_DIRECTIONS.index(direction)

    @direction = case curent_index
                 when 0..2
                   MAIN_DIRECTIONS[curent_index + 1]
                 when 3
                   MAIN_DIRECTIONS[0]
                 end
  end

  def turn_left
    curent_index = MAIN_DIRECTIONS.index(direction)

    @direction = case curent_index
                 when 1..3
                   MAIN_DIRECTIONS[curent_index - 1]
                 when 0
                   MAIN_DIRECTIONS[3]
                 end
  end

  def move
    next_position = find_next_position
    if in_bounds?(next_position)
      @position = next_position
    else
      p "At move #{@move_namber} in position #{next_position} rover want out of plateau"
    end
  end

  def find_next_position
    next_position = position.dup
    case @direction
    when 'N'
      next_position[1] += 1
    when 'E'
      next_position[0] += 1
    when 'S'
      next_position[1] -= 1
    when 'W'
      next_position[0] -= 1
    end
    next_position
  end

  def in_bounds?(next_position)
    (0..plateau[0]).include?(next_position[0]) && (0..plateau[1]).include?(next_position[1])
  end
end
