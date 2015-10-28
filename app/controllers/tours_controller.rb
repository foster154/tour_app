class ToursController < ApplicationController

	before_action :authenticate_user!, :except => [:show, :show_branded, :sample_tour1, :sample_tour2]
	before_action :correct_user, :except => [:index, :new, :create, :show, :show_branded, :sample_tour1, :sample_tour2]
	before_action :find_tour, :only => [:show, :show_branded, :edit, :update, :destroy]
	before_action :find_tour_agent, only: [:show, :show_branded]
	before_action :find_user, :only => [:index, :new]
	before_action :create_agent_list, only: [:new, :edit]
	before_action :check_for_tour_credit, only: [:create]
	after_action :remove_tour_credit, only: [:create]

	def index
		@tours = @user.tours.page(params[:page]).per_page(20)
	end

	def show
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		set_tour_theme
	end

	def show_branded
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@lead = Lead.new
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		@branded = true
		set_tour_theme
	end

	def sample_tour1
		@tour = Tour.find(12)
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render template: 'tours/sample_tour', layout: 'tour-default/tour-default'
	end

	def sample_tour2
		@tour = Tour.find(12)
		@photos = @tour.photos.where(processed: true).order(:position)
		@bg_photo = @photos[0]
		@hash = Gmaps4rails.build_markers(@tour) do |tour, marker|
  			marker.lat tour.latitude
  			marker.lng tour.longitude
		end
		render template: 'tours/sample_tour', layout: 'tour-graphista/tour-graphista'
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
			redirect_to root_url
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
		@tour.inactive = true
		@tour.save
		@tour.delay.destroy
		flash[:success] = "'#{@tour.address}' tour has been deleted."
		redirect_to :back
	end

	private

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

    	def find_tour_agent
    		if @tour.agent_id.present?
    			@tour_agent = Agent.find(@tour.agent_id)
    		else
    			@tour_agent = @user
    		end
    	end

    	def create_agent_list
    		@agent_list = current_user.agents.all
    	end

    	def set_tour_theme
			tour_theme = @tour.theme
			case tour_theme
			when 1
				render layout: 'tour-default/tour-default'
			when 2
				render layout: 'tour-graphista/tour-graphista'
			else
				render layout: 'tour-default/tour-default'
			end
    	end

    	def check_for_tour_credit
    		unless current_user.tour_available?
    			flash[:danger] = 'No tour credits available. Purchase one below to proceed.'
    			redirect_to dashboard_path
    		end
    	end

    	def remove_tour_credit
    		unless current_user.tours_unlimited
    			current_user.tour_credits = current_user.tour_credits - 1
    			current_user.save
    		end
    	end

    	def tour_params
	  		params.require(:tour).permit( :user_id, 
	  									  :address, 
	  									  :city, 
	  									  :state, 
	  									  :zip, 
	  									  :description, 
	  									  :price, 
	  									  :beds, 
	  									  :baths, 
	  									  :home_size, 
	  									  :lot_size, 
	  									  :year_built, 
	  									  :autoplay_music, 
	  									  :music_selection, 
	  									  :theme, 
	  									  :inactive,
	  									  :scheduler,
	  									  :scheduler_auto_display,
	  									  :agent_id,
	  									  photos_attributes: [:id, :tour_id, :photo] )
	  	end

end