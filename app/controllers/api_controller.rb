class ApiController < ActionController::Base
	def getPart
        part = Part.where(:name => params[:part_name]).first

        if part.nil?
            # TODO: fix responsse
            render :nothing => true, response: "Part: #{params[:part_name]} does not exist.", status: 400
        else
            render :json => part, status: 200
        end
	end
end