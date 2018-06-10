class SessionsController < ApplicationController

	def new 
         
	end	

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:sucess] = "você foi logado com sucesso"
			redirect_to  user_path(user)

		else
			flash.now[:danger] = "Login ou senha incorretos!"
			render 'new'
		end	

		##redirect_to users_path
	end
	
	def destroy
		session[:user_id] = nil
		flash[:sucess] = "Você foi deslogado com sucesso!"
		redirect_to root_path
	end	
end
