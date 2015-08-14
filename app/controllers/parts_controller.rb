class PartsController < ActionController::Base
	def index
	end

	def list
        @parts = Part.all.order(name: :asc)
	end

    def show
        @part = Part.find(params[:id])
        versions = Version.where(:part_name => @part.name).order(release_version: :desc)
        @versions = versions.pluck(:release_version)
        @selectedVersion = @part.current_version
        @downloads = @part.total_downloads
        @repoLink = "https://github.com/#{@part[:repo_owner]}/#{@part[:repo_name]}/releases/tag/v#{@selectedVersion}"
        @installationCommand = "parts install #{@part[:name]}"

        if !params[:version].nil? && params[:version] != @part.current_version
            @selectedVersion = params[:version]
            @downloads = versions.where(:release_version => @selectedVersion).first.number_of_downloads
            @repoLink = "https://github.com/#{@part[:repo_owner]}/#{@part[:repo_name]}/releases/tag/v#{@selectedVersion}"
            @installationCommand = "parts install #{@part[:name]} -v #{@selectedVersion}" 
        end
    end

    def oldversion
    end

    def search
    end
end