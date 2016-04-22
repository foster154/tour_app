module ToursHelper

	def website_helper(website)
		if website.length > 40
			'Website'
		else
			website
		end
	end

	def email_helper(email)
		if email.length > 40
			'Email'
		else
			email
		end
	end

	def photo_filename_limiter(filename)
		if filename.length > 18
			filename[0...16] + '...'
		else
			filename
		end
	end

end