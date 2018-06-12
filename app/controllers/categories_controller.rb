class CategoriesController < ApplicationController
	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end
	
	def new
		@category = Category.new
		#redirect_to users_path
	end

	def show

	end	

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to users_path	
		else
			render 'new'
		end	
	end	

	private
		def category_params
			params.require(:category).permit(:name)
		end	

end	