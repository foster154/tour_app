class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def support
  end

  def contact
  end

  def coming_soon
  	render layout: 'frontend'
  end

  def survey
    render layout: 'frontend'
  end

end
