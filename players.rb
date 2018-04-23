class Player
    attr_reader :lives
    attr_accessor :name

    def initialize(name, lives = 3)
        @name = name
        @lives = lives
    end

    def is_dead?
        @lives <= 0
    end

    def lose_lives
        @lives -= 1        
    end

end