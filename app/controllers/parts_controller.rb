class PartsController < ActionController::Base
	def index
    end

    def list
        @parts = Part.paginate(page: params[:page], per_page: 9).order(name: :asc)
	end

    def getDownloadLink(part, version)
        homepage = part.homepage
        homepage.slice! "https:\/\/github.com\/"
        homepage = homepage.split("\/")
        repo_owner = homepage[0]
        repo_name = homepage[1]
        return "https://api.github.com/repos/#{repo_owner}/#{repo_name}/releases/tags/v#{version}"
    end

    def show
        @part = Part.where(:name => params[:name]).first
        @versions = Version.where(:part_name => @part.name).order(version: :desc)
        @homepage = @part.homepage.clone
        @downloads = @part.total_downloads
        @downloadLink = getDownloadLink(@part, @part.version)
        @gemfileEntry = "part '#{@part[:name]}', '~> #{params[:version] ? params[:version] : @part.version}'"

        if !params[:version].nil? && params[:version] != @part.version
            @downloads = @versions.where(:version => params[:version]).first.number_of_downloads
            @downloadLink = getDownloadLink(@part, params[:version])
        end
    end

    def search
    end
end