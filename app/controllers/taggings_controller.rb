class TaggingsController < ApplicationController
  def index
    @taggings = Tagging.all

    render("taggings/index.html.erb")
  end

  def show
    @tagging = Tagging.find(params[:id])

    render("taggings/show.html.erb")
  end

  def new
    @tagging = Tagging.new

    render("taggings/new.html.erb")
  end

  def create
    @tagging = Tagging.new


    @tagging.tag_id = params[:tag_id]

    @tagging.event_id = params[:event_id]



    save_status = @tagging.save

    if save_status == true
      redirect_to(:back, :notice => "Tagging created successfully.")
    else
      render("taggings/new.html.erb")
    end

  end

  def edit
    @tagging = Tagging.find(params[:id])

    render("taggings/edit.html.erb")
  end

  def update
    @tagging = Tagging.find(params[:id])


    @tagging.tag_id = params[:tag_id]

    @tagging.event_id = params[:event_id]



    save_status = @tagging.save

    if save_status == true
      redirect_to(:back, :notice => "Tagging updated successfully.")
    else
      render("taggings/edit.html.erb")
    end

  end

  def destroy
    @tagging = Tagging.find(params[:id])

    @tagging.destroy

    if URI(request.referer).path == "/taggings/#{@tagging.id}"
      redirect_to("/", :notice => "Tagging deleted.")
    else
      redirect_to(:back, :notice => "Tagging deleted.")
    end
  end
end
