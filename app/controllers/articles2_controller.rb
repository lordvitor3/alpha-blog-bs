class Articles2Controller < ApplicationController

	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def new
		@article2 = Article.new
	end	

	def index
		@articles = articles.all
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

	def edit
    	set_article
	end	

	def update
		set_article
        if @article2.update(article_params)
			flash[:notice] = "Article was sucessfully update"
			redirect_to article_path(@article)
		else
			render 'edit'
		end	   	


	end	

	def show
		set_article
	end	

	def destroy
		set_article
		@article.destroy
 		flash[:notice] = "Article was sucessfuly deleted"
		redirect_to articles_path
	end	

	def set_article
		@article = Article.fund(params[:id])
	end	

	private
		def article_params
             params.require(:article2).permit(:title, :description)

        end

end

