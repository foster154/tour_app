class ToursController < ApplicationController
	before_action :signed_in_user,  except: :show
	# before_action :correct_user,  	except: :show

	def index
		@user = User.find(params[:user_id])
		@tours = @user.tours.paginate(page: params[:page])
	end

	def show
		@tour = Tour.find(params[:id])
		render layout: 'tour'
	end

	def new
		@user = User.find(params[:user_id])
		@tour = Tour.new({:user_id => @user.id})
	end

	def create
		@tour = current_user.tours.build(tour_params)
		if @tour.save
			flash[:success] = "Tour created for '#{@tour.address}'. Next, let's add some photos!"
			redirect_to edit_tour_path(id: @tour.id)
		else
			flash[:danger] = 'Could not create tour.'
			redirect_to :back
		end
	end

	def edit
		@tour = Tour.find(params[:id])
		@photo = Photo.new({tour_id: @tour.id})
		@user = @tour.user_id
	end

	def update
		@tour = Tour.find(params[:id])
	    if @tour.update_attributes(tour_params)
	      flash[:success] = "Tour for '#{@tour.address}' updated!"
	      redirect_to edit_tour_path(id: @tour.id)
	    else
	      flash[:danger] = 'Could not update tour.'
		  redirect_to :back
	    end
	end

	def destroy
		@tour = Tour.find(params[:id])
		@tour.destroy
		flash[:success] = "'#{@tour.address}' tour deleted!"
		redirect_to :back
	end

	private

		def tour_params
	  		params.require(:tour).permit(:user_id, :address, :city, :state, :zip, :description, :price, :beds, :baths, :home_size, :lot_size, :year_built)
	  	end

end