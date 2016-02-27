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
        version = params[:version] ? params[:version] : @part.version
        @downloads = @versions.where(:version => version).first.number_of_downloads
        @downloadLink = getDownloadLink(@part, version)
        @gemfileEntry = "part '#{@part[:name]}', '~> #{version}'"
        @dependencies = Dependency.where(:part_version => version, :part_name=> @part.name)
    end

    def search
        @title = 'Search Results'
        @parts = Part.paginate(page: params[:page], per_page: 9).where("name LIKE \"%#{params[:search]}%\" or description LIKE \"%#{params[:search]}%\"")
    end
end