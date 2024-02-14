Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/insert_user_record", {:controller => "users", :action => "createUsers"})
  post("/update_username/:update_id", {:controller => "users", :action => "updateuser"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_photos", { :controller => "photos", :action => 'show'})
  get("/delete_photo/:toast_id", {:controller => "photos", :action => 'delete'})
  get("/insert_photo_record", {:controller => "photos", :action => "create"})
  get("/update_photo/:update_id", {:controller => "photos", :action => "update"})
  get("/insert_comment_record", {:controller => "photos", :action => "createComment"})


end
