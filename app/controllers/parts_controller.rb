class PartsController < ActionController::Base
	def index
	end

	def list
        @items = Part.all
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