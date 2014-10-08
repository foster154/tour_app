class ToursController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :show_branded]
	before_action :correct_user, :except => [:index, :new, :create, :show, :show_branded, :sample_tour]
	before_action :find_tour, :only => [:show, :show_branded, :edit, :update, :destroy]
	before_action :find_user, :only => [:index, :new]

	def index
		@tours = @user.tours.where(active: true).page(params[:page]).per_page(20)
	end

	def show
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render layout: 'tour-default/tour-default'
	end

	def show_branded
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		@branded = true
		render layout: 'tour-default/tour-default'
	end

	def sample_tour
		@tour = Tour.find(12)
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render layout: 'tour-default/tour-default'
	end

	def new
		@tour = Tour.new({:user_id => current_user.id})
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
		@tour.active = false
		@tour.save
		@tour.delay.destroy
		flash[:success] = "'#{@tour.address}' tour has been deleted."
		redirect_to :back
	end

	private

		def tour_params
	  		params.require(:tour).permit(:user_id, :address, :city, :state, :zip, :description, :price, :beds, :baths, :home_size, :lot_size, :year_built, photos_attributes: [:id, :tour_id, :photo])
	  	end

	  	# BEFORE FILTERS

	    def correct_user
	      unless current_user.id.to_i == Tour.find(params[:id]).user_id.to_i
	        redirect_to root_url
	      end
	    end

	  	def find_tour
      		@tour = Tour.find(params[:id])
    	end

	  	def find_user
	  		@user = User.find(current_user.id)
    	end

end