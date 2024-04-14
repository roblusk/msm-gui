Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("directors", { :controller => "directors", :action => "create" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete_this" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors/:path_id", { :controller => "directors", :action => "update" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("movies", { :controller => "movies", :action => "create" })
  post("delete_movie/:path_id", { :controller => "movies", :action => "delete_this" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies/:path_id", { :controller => "movies", :action => "update" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
end
