require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	
	def setup
		@category = Category.create(name: "games")
		@user = User.create(username: "vitor", email: "cid.vitor@hotmail.com", password: "password", admin: true)
	end	

	test "should get categories index" do 
		get :index
		assert_response :success		
	end

	test "should get new" do
		sign_in_as (@user,"password")
		#session[:user_id] = @user.id - Não pode ser feito no rails 5
		get :new
		assert_response :success
	end

	
	test "should redirect creat when admin not logged in" do
		assert_no_difference 'Category.count' do
			post :create, category: {name: "sports" }
		end	
		assert_redirected_to categories_path
	end

	#test "should get show" do
	#get(:show, {'id' => @category.id})
	#assert_response :success 
	#end	

end
