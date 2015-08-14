require 'net/http'
require 'pry'

class UploadsController < ActionController::Base
    def index
    end

    def update
        part = Part.where(:name => params[:part_name]).first

        if (!part.nil? && params[:release_version] > part.current_version)
            Version.create(:part_name => params[:part_name], :release_version => params[:release_version])
            part.update_attributes(:current_version => params[:release_version])
        end
    end

    def new
        if (Part.where(:name => params[:part_name]).empty?)
            Part.create(:name => params[:part_name], :description => params[:part_description], :repo_name => params[:repo_name],
                :repo_owner => params[:repo_owner], :current_version => params[:release_version], :author_name => params[:author_name], 
                :author_email => params[:author_email])
            Version.create(:part_name => params[:part_name], :release_version => params[:release_version])
        end
    end
end