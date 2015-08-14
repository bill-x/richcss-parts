class ApiController < ActionController::Base
	def getPartURL
        part = Part.where(:name => params[:part_name]).first
        latestVersion = Version.where(:part_name => params[:part_name]).order(release_version: :desc).first

        uri = URI("https://api.github.com/repos/#{part.repo_owner}/#{part.repo_name}/releases/tags/v#{latestVersion.release_version}")
        jsonResponse = JSON.parse(Net::HTTP.get(uri))
        downloadLink = jsonResponse["zipball_url"]

        partJson = {
            "name" => params[:part_name],
            "url" => downloadLink
        }

        render :json => partJson
	end
end