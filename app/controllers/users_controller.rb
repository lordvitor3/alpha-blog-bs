class UsersController < ApplicationController
	
	def login
		@user = User.new
	end	

	def new
		@user = User.new
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def create
  
    @user = User.new(user_params)

    respond_to do |format|
       
      if @user.save
        format.html { redirect_to users_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  
	end


	def edit
		@user = User.find(params[:id])

	end	

	def fibonnaci
		@soma
		n1 = 1
		n2 = 1
		for i in 0..5
   			@soma=n1+n2
   			n1 = n2
   			n2 = @soma
		end
	end	

	def user_params
		params.require(:user).permit(:username, :password, :email)
	end

	def show
		set_user
	end

	def set_user
		@user = User.find(params[:id])
	end	

end		