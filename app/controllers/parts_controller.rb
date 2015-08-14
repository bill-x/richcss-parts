class PartsController < ActionController::Base
	def index
	end

	def list
        @parts = Part.all.order(name: :asc)
	end

    def show
        @part = Part.find(params[:id])
        @versions = Version.where(:part_name => @part.name).order(release_version: :desc).pluck(:release_version)
    end

    def oldversion
    end

    def search
    end
end