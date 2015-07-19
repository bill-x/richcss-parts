class PartsController < ActionController::Base
	def index
	end

	def list
        @size = 3

        struct = Struct.new(:id, :version, :downloads, :summary)

        a = struct.new("Twitter Bootstrap", "4.0.0", 23425, "Twitter Bootstrap")
        b = struct.new("Custom CSS 1", "1.0.0", 3513546, "Custom CSS")
        c = struct.new("Custom CSS 2", "2.0.0", 168, "Custom CSS")
        d = struct.new("Custom CSS 3", "4.1.0", 515, "Custom CSS")
        e = struct.new("Custom CSS 4", "3.0.0", 456, "Custom CSS")
        f = struct.new("Custom CSS 5", "0.0.5", 234534, "Custom CSS")

        @items = [a,b,c,d,e,f]
	end

    def show
        struct = Struct.new(:id, :version, :downloads, :summary)

        @item = struct.new("Custom CSS", "1.0.1", 23425, "Custom CSS")
        @versions = ["1.0.1", "1.0.0", "0.9.9"]
    end

    def oldversion
    end

    def search
    end
end