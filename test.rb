class ClassA
    
    attr_accessor :bar, 'baz'
    def a
        puts "Aa"
    end

    protected
    def b
        puts "Ab"
    end

    def c
        puts "Ac"
    end

    private
    def d
        puts "Ad"
    end

    def e
        puts "Ae"
    end

end

class ClassB < ClassA
    
    def callb
        self.b
    end

    def calle
        self.e
    end
end