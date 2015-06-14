class PartsController < ActionController::Base
	def index
	end

	def list
        @size = 3

        struct = Struct.new(:id, :version, :downloads, :summary)

        a = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        b = struct.new("Runescape", "3.7.110", 3513546, "A game")
        c = struct.new("MaQuan", "0.0.0", 1, "a monster")
        d = struct.new("Testing Framework 2", "0.1.0", 515, "A testing framework 2")
        e = struct.new("Testing Framework 3", "3.0.0", 456, "A testing framework 3")
        f = struct.new("Testing Framework 4", "0.0.5", 234534, "A testing framework 4")

        @items = [a,b,c,d,e,f]
	end

    def show
    end

    def oldversion
    end

    def search
    end
end