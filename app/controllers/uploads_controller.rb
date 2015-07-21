class UploadsController < ActionController::Base
    def index
    end

    def update
        part = Part.where(:name => params[:part_name]).first

        # NOTE:do we need to check release number as well?
        if (!part.nil? && params[:part_version] > part.current_version)
            Version.create(:part_name => params[:part_name], :version => params[:part_version], :release_number => params[:github_release_number])
            part.update_attributes(:current_version => params[:part_version])
        end
    end

    def new
        if (Part.where(:name => params[:part_name]).empty?)
            # TODO get files and folders from github link to verify structure

            # dependencyHash = checkForValidFolderAndFileStructure(params[:part_name], params[:part_version])

            if dependencyHash[:error].nil?
                Part.create(:name => params[:part_name], :current_version => params[:part_version], :description => params[:part_description],
                    :github_link => params[:github_link], :author_name => params[:author_name], :author_email => params[:author_email])
                Version.create(:part_name => params[:part_name], :version => params[:part_version], :release_number => params[:github_release_number])
                Contributor.create(:part_name => params[:part_name], :name => params[:contributors])
                
                if !dependencyHash.empty?
                    dependencyHash.each do |dependencyName, dependencyVersion|
                      Dependency.create(:part_name => params[:part_name], :part_version => params[:part_version], :dependency_name => dependencyName, :dependency_version => dependencyVersion)
                    end
                end
            end
        end
    end

    def checkForValidFolderAndFileStructure(partName, partVersion)
    	dependencyFileName = partName + ".txt"
    	dependencyHash = {}

    	if (!File.directory?(partName))
    		# return error
    	end

    	# go into that partName directory
    	if (!File.directory?("box"))
    		# return error
    	end

    	if (!File.directory?("elements"))
    		# return error
    	end

    	if (!File.file?(dependencyFileName))
    		# return error
    	else
    		dependencyHash = Dependency.check_dependency_file(dependencyFileName)
    	end

        return dependencyHash
    end
end