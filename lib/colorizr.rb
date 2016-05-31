class String
  @@colors = {
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    pink: 35,
    light_blue: 94,
    white: 97,
    light_grey: 37,
    black: 30
  }

  def self.create_colors
    @@colors.each do |color, value|
      self.send(:define_method, color.to_s) do
        "\e[#{value}m#{self}\e[0m"
      end
    end
  end

  def self.colors
    colors = []
    @@colors.each do |color, value|
      colors << color
    end
    colors
  end

  def self.sample_colors
    colors.each do |color|
      puts "This is #{color.to_s.send(color)}"
    end
  end
end

String.create_colors
