class EventsController < ApplicationController
  def index
    @events = Event.all

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new


    render("events/show.html.erb")
  end

  def new
    @event = Event.new
    @friendships = Friendship.all

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



  @response = Response.new
          params[:invites].each do |i|
            @response = Response.new

            @response.user_id = i


            @response.event_response = "Pending"

            @response.back_out = 0

            @response.event_id = @event.id

            @response.save
          end



    if save_status == true
      redirect_to(:back, :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end

  end



  def edit
    @event = Event.find(params[:id])
    @friendships = Friendship.all


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

            params[:invites].each do |i|
              if @event.responses.find_by user_id: i
            else
              @response = Response.new

              @response.user_id = i


              @response.event_response = "Pending"

              @response.back_out = 0

              @response.event_id = @event.id

              @response.save
            end
          end



    if save_status == true
      redirect_to("/events", :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end

  end

  def accept

## add if spots is 0 do nothing but send a warning message
##else

    @event = Event.find(params[:id])

if @event.number_of_spots == 0
  redirect_to(:back, :alert=> "Sorry this event is full! Reach out to the creator to open up more spots.")
else

    @event.number_of_spots = @event.number_of_spots - 1
    @event.save
    @response = @event.responses.find_by_user_id(current_user.id)

    @response.event_response = "Accepted"

    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Event has been accepted successfully.")
    else
      render("events.html.erb")
    end

  end
end
def reject
      @event = Event.find(params[:id])
      @response = @event.responses.find_by_user_id(current_user.id)

      @response.event_response = "Rejected"

      save_status = @response.save

      if save_status == true
        redirect_to(:back, :notice => "Event has been rejected successfully.")
      else
        render("events.html.erb")
      end
end

def back_out
      @event = Event.find(params[:id])
      @event.number_of_spots = @event.number_of_spots + 1
      @event.save
      @response = @event.responses.find_by_user_id(current_user.id)

      @response.event_response = "Rejected"

      save_status = @response.save

      if save_status == true
        redirect_to(:back, :notice => "Event has been rejected successfully.")
      else
        render("events.html.erb")
      end
end

def hide
      @event = Event.find(params[:id])
      @response = @event.responses.find_by_user_id(current_user.id)

      @response.event_response = "Hidden"

      save_status = @response.save

      if save_status == true
        redirect_to(:back, :notice => "Event has been hidden successfully.")
      else
        render("events.html.erb")
      end
end


  def destroy
    @event = Event.find(params[:id])

    @event.responses.each do |response|
      response.destroy
      response.save
    end

    @event.event_comments.each do |comment|
      comment.destroy
      comment.save
    end

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_to(:back, :notice => "Event deleted.")
    end
  end
end
