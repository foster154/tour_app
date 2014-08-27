module ApplicationHelper
	# Returns the full title on a per page basis.
	def full_title(page_title)
		base_title = "Show & Tour"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def bootstrap_class_for flash_type
	    case flash_type
	      when :success
	        "alert-success"
	      when :danger
	        "alert-danger"
	      when :warning
	        "alert-warning"
	      when :info
	        "alert-info"
	      else
	        flash_type.to_s
	    end
	end

    def correct_user
		if params.has_key?(:user_id)
  			@user_compare = User.find(params[:user_id]).id
  		else
  			@user_compare = Tour.find(params[:id]).user_id
  		end
  		redirect_to(root_url) unless current_user.id == @user_compare
	end

end
