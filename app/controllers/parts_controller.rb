class PartsController < ActionController::Base
	def index
	end

	def list

        a = Part.new
        a.name = "Twitter Bootstrap"
        a.current_version = "4.0.0"
        a.description = "Twitter Boostrap"
        a.total_downloads = 23425

        b = Part.new
        b.name = "Custom CSS 1"
        b.current_version = "1.0.0"
        b.description = "Custom CSS"
        b.total_downloads = 43

        c = Part.new
        c.name = "Custom CSS 2"
        c.current_version = "1.0.0c"
        c.description = "Custom CSS"
        c.total_downloads = 5315

        d = Part.new
        d.name = "Custom CSS 3"
        d.current_version = "2.0.0.0"
        d.description = "Custom CSS"
        d.total_downloads = 13

        e = Part.new
        e.name = "Custom CSS 4"
        e.current_version = "Beta"
        e.description = "Custom CSS"
        e.total_downloads = 3

        f = Part.new
        f.name = "Custom CSS 5"
        f.current_version = "Release_3.0"
        f.description = "Custom CSS"
        f.total_downloads = 4531

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