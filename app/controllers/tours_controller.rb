class ToursController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@tours = @user.tours.page(params[:page]).per_page(20)
	end

	def show
		@tour = Tour.find(params[:id])
		@photos = @tour.photos.order(:position)
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render layout: 'tour-elegant/tour-elegant'
	end

	def show_branded
		@tour = Tour.find(params[:id])
		@photos = @tour.photos.order(:position)
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		@branded = true
		render layout: 'tour-elegant/tour-elegant'
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
		@photos = @tour.photos.order(:position)
		@user = @tour.user_id
	end

	def update
		@tour = Tour.find(params[:id])
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
		@tour = Tour.find(params[:id])
		@tour.destroy
		flash[:success] = "'#{@tour.address}' tour deleted!"
		redirect_to :back
	end

	private

		def tour_params
	  		params.require(:tour).permit(:user_id, :address, :city, :state, :zip, :description, :price, :beds, :baths, :home_size, :lot_size, :year_built, photos_attributes: [:id, :tour_id, :photo])
	  	end

end