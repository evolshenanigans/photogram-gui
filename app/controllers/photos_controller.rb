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

  def update
#Parameters: {"the_image"=>"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Ameca_Generation_1.jpg/800px-Ameca_Generation_1.jpg", "the_caption"=>"asah", "update_id"=>"952"}
    the_id = params.fetch("update_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first

    input_image = params.fetch("the_image")
    input_caption = params.fetch("the_caption")
    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save


    redirect_to("/photos/" + the_photo.id.to_s)

  end
  def createComment
    #Parameters: {"the_photo_id"=>"777", "the_author_id"=>"98", "the_comment"=>"test"}

    matching_comments = Comment.all
    @ordered_comments = matching_comments.order({ :created_at => :desc})
    the_photo_id = params.fetch("the_photo_id")
    the_author_id = params.fetch("the_author_id")
    the_comment = params.fetch("the_comment")

    c = Comment.new
    c.photo_id = the_photo_id
    c.author_id = the_author_id
    c.body = the_comment
    c.save
    
    redirect_to("/photos/")
    # render({:template => "photo_templates/createComment"})
  end


end
