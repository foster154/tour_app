class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:index, :edit, :update]
  before_action :correct_user,    only: [:edit, :update, :show]
  before_action :admin_user,      only: [:destroy, :index]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @tours = @user.tours.limit(5)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to TourApp!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :phone, :company, :user_url, :password, :password_confirmation, :user_image)
  	end

    
end
