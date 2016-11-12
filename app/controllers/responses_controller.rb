class ResponsesController < ApplicationController
  def index
    @responses = Response.all

    render("responses/index.html.erb")
  end

  def show
    @response = Response.find(params[:id])

    render("responses/show.html.erb")
  end

  def new
    @response = Response.new

    render("responses/new.html.erb")
  end

  def create
    @response = Response.new


    @response.user_id = params[:user_id]

    @response.event_id = params[:event_id]

    @response.event_response = params[:event_response]

    @response.back_out = params[:back_out]



    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Response created successfully.")
    else
      render("responses/new.html.erb")
    end

  end

  def edit
    @response = Response.find(params[:id])

    render("responses/edit.html.erb")
  end

  def update
    @response = Response.find(params[:id])


    @response.user_id = params[:user_id]

    @response.event_id = params[:event_id]

    @response.event_response = params[:event_response]

    @response.back_out = params[:back_out]



    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Response updated successfully.")
    else
      render("responses/edit.html.erb")
    end

  end

  def destroy
    @response = Response.find(params[:id])

    @response.destroy

    if URI(request.referer).path == "/responses/#{@response.id}"
      redirect_to("/", :notice => "Response deleted.")
    else
      redirect_to(:back, :notice => "Response deleted.")
    end
  end
end
