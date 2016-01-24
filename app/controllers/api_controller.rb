require 'pry'
class ApiController < ActionController::Base
	def getPart
        part = Part.where(:name => params[:part_name]).first

        if part.nil?
            render :text => "Part: #{params[:part_name]} does not exist.", status: 400
            return
        end
        
        render :json => part, status: 200
	end

    def upload
        part = Part.where(:name => params[:name]).first
        if part.nil?
            Part.create(:name => params[:name], :description => params[:description], :version => params[:version],
                :authors => params[:authors], :email => params[:email], :homepage => params[:homepage])
            Version.create(:part_name => params[:name], :version => params[:version])

            if !params[:dependencies].empty?
                params[:dependencies].each do |dependency_name, dependency_version|
                    Dependency.create(:part_name => params[:name], :part_version => params[:version],
                        :dependency_name => dependency_name, :dependency_version => dependency_version)
                end
            end

            render :text => "Successfully created css part: #{params[:name]}", status: 200
        else
            if Gem::Version.new(params[:version]) > Gem::Version.new(part.version)
                Version.create(:part_name => params[:name], :version => params[:version])
                part.update_attributes(:version => params[:version])

                if !params[:dependencies].empty?
                    params[:dependencies].each do |dependency_name, dependency_version|
                        Dependency.create(:part_name => params[:name], :part_version => params[:version],
                            :dependency_name => dependency_name, :dependency_version => dependency_version)
                    end
                end

                render :text => "Successfully updated css part: #{part.name} to version: #{params[:version]}", status: 200
            else
                render :text => "Specified version #{params[:version]} not greater than latest version: #{part.version}", status: 400
            end
        end
    end

    def validateDependencies
        params[:dependencies].split("&").each do |dependency|
            dependency_values = dependency.split("=")
            versions = Version.where(:part_name => dependency_values[0])

            if versions.empty?
                render :text => "Part: #{dependency_values[0]} does not exist.", status: 400
                return
            else
                part = versions.where(:version => dependency_values[1]).first
                if part.nil?
                    render :text => "Part: #{dependency_values[0]} with version: #{dependency_values[1]} does not exist", status: 400
                    return
                end
            end
        end

        render :nothing => true, status: 200
    end
end