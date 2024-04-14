class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def create
    the_actor = Actor.new
    the_actor.name = params.fetch("name_input")
    the_actor.dob = params.fetch("dob_input")
    the_actor.bio = params.fetch("bio_input")
    the_actor.image = params.fetch("image_input")
    the_actor.save
    redirect_to("/actors")
  end

  def delete_this
    the_id = params.fetch("path_id")
    the_actor = Actor.find(the_id)
    the_actor.destroy
    redirect_to("/actors")
  end
  
  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def update
    the_id = params.fetch("path_id")
    the_actor = Actor.find(the_id)
    the_actor.name = params.fetch("name_input")
    the_actor.dob = params.fetch("dob_input")
    the_actor.bio = params.fetch("bio_input")
    the_actor.image = params.fetch("image_input")
    the_actor.save
    redirect_to("/actors/#{the_actor.id}")
  end
end
