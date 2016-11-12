class EventsController < ApplicationController
  def index
    @events = Event.all

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new


    @event.title = params[:title]

    @event.description = params[:description]

    @event.street = params[:street]

    @event.city = params[:city]

    @event.state = params[:state]

    @event.zip = params[:zip]

    @event.neighborhood = params[:neighborhood]

    @event.number_of_spots = params[:number_of_spots]

    @event.date_time = Chronic.parse(params[:date_time])

    @event.image_url = params[:image_url]

    @event.public_private = params[:public_private]

    @event.flakiness_bar = params[:flakiness_bar]

    @event.user_id = params[:user_id]



    save_status = @event.save

    if save_status == true
      redirect_to(:back, :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end

  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])


    @event.title = params[:title]

    @event.description = params[:description]

    @event.street = params[:street]

    @event.city = params[:city]

    @event.state = params[:state]

    @event.zip = params[:zip]

    @event.neighborhood = params[:neighborhood]

    @event.number_of_spots = params[:number_of_spots]

    @event.date_time = Chronic.parse(params[:date_time])

    @event.image_url = params[:image_url]

    @event.public_private = params[:public_private]

    @event.flakiness_bar = params[:flakiness_bar]

    @event.user_id = params[:user_id]



    save_status = @event.save

    if save_status == true
      redirect_to("/events", :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end

  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_to(:back, :notice => "Event deleted.")
    end
  end
end
