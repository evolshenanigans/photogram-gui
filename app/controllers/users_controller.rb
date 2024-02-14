class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index"})
  end

  def show
    #Parameteres: {"path_username => anisa"}
  url_username = params.fetch("path_username")

   matching_usernames = User.where({:username => url_username})
   @the_user = matching_usernames.first

    render({ :template => "user_templates/show"})
  end
  def createUsers
  input_username = params.fetch("the_username")
  
  u = User.new
  u.username = input_username
  u.save

  redirect_to("/users/" + u.username.to_s)
    # render({ :template => "user_templates/createuser"})
  end
  def updateuser
    the_id = params.fetch("update_id")
    matching_users = User.where({:id => the_id})
    the_user = matching_users.first
    the_user.username = params.fetch("username")
    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
    # render({ :template => "user_templates/updateuser"})
  end

end
