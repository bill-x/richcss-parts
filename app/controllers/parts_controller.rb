class PartsController < ActionController::Base
	def index
	end

	def list
        @parts = Part.all
	end

    def show
        @part = Part.find(params[:id])
        @versions = Version.where(:part_name => @part.name).order(version: :desc).pluck(:version)
    end

    def oldversion
    end

    def search
    end
end