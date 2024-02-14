class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index"})
  end

  def show
    #Parameters: {"path_photos"=>"777"}
    url_id = params.fetch("path_photos")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show"})
  end

  def delete
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.first
    the_photo.destroy
    # render({:template => "photo_templates/delete"})
    redirect_to("/photos")
  end
  def create
    
  input_image = params.fetch("the_image")
  input_caption = params.fetch("the_caption")
  input_id = params.fetch("owner_id")

  p = Photo.new
  p.image = input_image
  p.caption = input_caption
  p.owner_id = input_id
  p.save
    redirect_to("/photos/" + p.id.to_s)
  end

end
