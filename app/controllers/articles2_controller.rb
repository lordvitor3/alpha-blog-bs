class Articles2Controller < ApplicationController
	def new
		@article2 = Article.new
	end	

	 def create

		@article = Article.new(article_params)

		if @article.save		

			flash[:notice] = "Article was successfully created"

			redirect_to article_path(@article)

		else

			render 'new'

		end

	end

	def show
		@article2 = Article.find(params[:id])
	end	

	private
		def article_params
             params.require(:article2).permit(:title, :description)

        end

end

