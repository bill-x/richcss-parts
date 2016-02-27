class Dependency < ActiveRecord::Base
  self.table_name = "dependencies"

	def self.get_dependencies(partName, partVersion = nil) 
		dependencyHash = {}
		part = partVersion.nil? ? Part.where(:part_name => partName).first : Part.where(:part_name => partName, :part_version => partVersion).first

		if (part.nil?)
			return {:error => "Invalid Part: Part Name: " + partName + " Version: " + partVersion}
		end

		dependencyHash[part.part_name] = part.github_link
		dependencies = Dependency.where(:part_name => part.part_name, :part_version => part.part_version)

		# TODO: implement dependency resolving algo

		return dependencyHash
	end

	def self.check_dependency_file(dependencyFileName)
		dependencyHash = {}

		File.open(dependencyFileName, "r") do |file|
		    while (line = file.gets)
		    	splits = line.strip!.split(":")

		    	if (Version.where(:part_name => splits[0], :version => splits[1]).empty?)
		    		return {:error => "Invalid Part Dependency: Part Name: " + splits[0] + " Version: " + splits[1]}
		    	else
		    		dependencyHash[split[0]] = split[1]
		    	end
		    end
		end

		return dependencyHash
	end
end