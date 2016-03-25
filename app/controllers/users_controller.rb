class Api::UsersController < ApplicationController
	#Solucionar (para esta clase) el error: ActionController::InvalidAuthenticityToken
	#protect_from_forgery :only => [:create, :update, :destroy]
	
	def index
		@users = User.all
		respond_to do |format|
			format.json { render json: @users }
			format.xml { render xml: @users }
		end
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.json { render json: @user }
			format.xml { render xml: @user }
		end
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.json { render json: @user, status: :created }
				format.xml { render xml: @user, status: :created }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
				format.xml { render xml: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.json { head :no_content, status: :ok }
				format.xml { head :no_content, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
				format.xml { render xml: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.destroy
				format.json { head :no_content, status: :ok }
				format.xml { head :no_content, status: :ok }
			else
				format.json { render json: @user.errors, status: :unprocessable_entity }
				format.xml { render xml: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email)
	end
end
