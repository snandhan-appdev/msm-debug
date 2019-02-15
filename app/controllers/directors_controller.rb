class DirectorsController < ApplicationController
  def index
    @directors = Director.all

    render("director_templates/index.html.erb")
  end

  def show
    @director = Director.find(params.fetch("id_to_display"))

    render("director_templates/show_details.html.erb")
  end

  def new_form
    render("director_templates/new_form.html.erb")
  end

  def create_row
    d = Director.new
    d.dob = params.fetch("dob")
    d.name = params.fetch("name")
    d.bio = params.fetch("bio")
    d.image_url = params.fetch("image_url")
    d.save
    redirect_to("/directors", :notice => "Director created successfully.")
  end

  def edit_form
    @director = Director.find(params.fetch("prefill_with_id"))

    render("director_templates/edit_form.html.erb")
  end

  def update_row
    d = Director.find(params.fetch("id_to_modify"))

    d.dob = params.fetch(:dob)
    d.name = params.fetch(:name)
    d.bio = params.fetch(:bio)
    d.image_url = params.fetch(:image_url)
    d.save

    redirect_to("/directors/#{d.id}", :notice => "Director updated successfully.")
  end

  def destroy_row
    d = Director.find(params.fetch("id_to_remove"))
    d.destroy
    d.save
    
    redirect_to("/directors", :notice => "Director deleted successfully.")
  end
end
