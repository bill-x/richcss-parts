class PartsController < ActionController::Base
	def index
	end

	def list
        @size = 3

        struct = Struct.new(:id, :version, :downloads, :summary)

        a = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        b = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        c = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        d = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        e = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")
        f = struct.new("Testing Framework", "0.0.0", 23425, "A testing framework")

        @items = [a,b,c,d,e,f]
	end

    def show
    end

    def oldversion
    end
end