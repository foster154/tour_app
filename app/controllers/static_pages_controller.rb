class StaticPagesController < ApplicationController
  def home
  end

  def features
  end

  def about
  end

  def contact
  end

  def coming_soon
  	render layout: 'coming_soon'
  end

  def survey
    render layout: 'coming_soon'
  end

end
