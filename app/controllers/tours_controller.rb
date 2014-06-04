class ToursController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :show_branded]
	before_action :find_tour, :only => [:show, :show_branded, :edit, :update, :destory]
	before_action :find_user, :only => [:index, :new]
	before_action :correct_user, :except => [:create, :show, :show_branded]

	def index
		@tours = @user.tours.page(params[:page]).per_page(20)
	end

	def show
		@photos = @tour.photos.order(:position)
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render layout: 'tour-elegant/tour-elegant'
	end

	def show_branded
		@photos = @tour.photos.order(:position)
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		@branded = true
		render layout: 'tour-elegant/tour-elegant'
	end

	def new
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
		# @user = @tour.user_id
		@photo = Photo.new({tour_id: @tour.id})
		@photos = @tour.photos.order(:position)
	end

	def update
	    if @tour.update_attributes(tour_params)
	    	if params[:photos]
		    	params[:photos]['photo'].each do |photo|
		    		@photo = @tour.photos.create!(:photo => photo, :tour_id => @tour.id)
		    	end
		    end
	    flash[:success] = "Tour for '#{@tour.address}' updated!"
        redirect_to edit_tour_path(id: @tour.id)
	    else
	      flash[:danger] = 'Could not update tour.'
		  redirect_to :back
	    end
	end

	def destroy
		@tour.destroy
		flash[:success] = "'#{@tour.address}' tour deleted!"
		redirect_to :back
	end

	private

		def tour_params
	  		params.require(:tour).permit(:user_id, :address, :city, :state, :zip, :description, :price, :beds, :baths, :home_size, :lot_size, :year_built, photos_attributes: [:id, :tour_id, :photo])
	  	end

	  	def find_tour
      		@tour = Tour.find(params[:id])
    	end

	  	def find_user
	  		@user = User.find(params[:user_id])
    	end

    	def correct_user
			if params.has_key?(:user_id)
	  			@user_compare = User.find(params[:user_id]).id
	  		else
	  			@user_compare = Tour.find(params[:id]).user_id
	  		end
	  		redirect_to(tours_path(user_id: current_user.id)) unless current_user.id == @user_compare
		end

end