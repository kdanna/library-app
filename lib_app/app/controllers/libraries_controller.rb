class LibrariesController < ApplicationController
	def index
		@libraries = Library.all
		@current_user = current_user
	end

	def new
    	@library = Library.new
  	end

  	def show
  		@library = Library.find(params[:id])
  	end
  	
  	def create
	    library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
	    @library = Library.create(library_params)

	    redirect_to "/libraries"
  	end

  	def edit
		@library = Library.find(params[:id])
		render :edit
	end

	def update
		@library = Library.find(params[:id])
		library_params = params.require(:library).permit(:name, :floor_count, :floor_area)
		if Library.update(@library.id, library_params)
			redirect_to "/libraries/#{@library.id}"
		else 
			render :edit
		end
	end

	def destroy
		library = Library.find_by_id params[:id]
		library.destroy
		redirect_to "/libraries"
	end


end
