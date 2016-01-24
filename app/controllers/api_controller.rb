class ApiController < ActionController::Base
	def getPart
        part = Part.where(:name => params[:part_name]).first

        if part.nil?
            render :text => "Part: #{params[:part_name]} does not exist.", status: 400
        else
            render :json => part, status: 200
        end
	end

  def getPartWithVersion
        part = Version.where(:name => params[:part_name], :version => params[:version]).first

        if part.nil?
            render :text ="Part: #{params[:part_name]} with version #{params[:version]} does not exist.", status: 400
        else
            render :json => part, status: 200
        end
  end
end