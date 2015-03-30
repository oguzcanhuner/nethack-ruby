class Cell
  def initialize(x, y, content: EmptyCell.new)
    @x = x
    @y = y
    @content = content
  end
  
  attr_reader :x, :y, :content
  attr_accessor :content

  def to_s
    content.to_s
  end

  def coords
    [x, y]
  end
end

class EmptyCell
  def initialize
    @character = " . "
  end

  def to_s
    @character
  end
end

class NullCell
  def to_s
    ""
  end
end
