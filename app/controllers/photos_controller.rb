class PhotosController < ApplicationController
# @http_method XHR POST
# @url /photos
  before_action :set_photo, only: [:update, :destroy]

  def create
    @tour = Tour.find(params[:tour_id])
    @photo = @tour.photos.create(photo_params)
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :json => @photo}
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def sort    # for drag and drop photo sorting on the 'edit tour' page
    params[:photo].each_with_index do |id, index| 
      Photo.where(id: id).update_all(position: index+1)
    end
    render nothing: true
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:direct_upload_url, :tour_id, :label)
  end
end