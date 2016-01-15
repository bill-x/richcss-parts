require 'net/http'

class UploadsController < ActionController::Base
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
end