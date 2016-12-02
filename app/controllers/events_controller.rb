require 'open-uri'
require 'json'


class EventsController < ApplicationController
  def index
    @events = Event.all

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new



if @event.street != ""
    @street_address_without_spaces = URI.encode(@event.street)

        url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address_without_spaces}"

        raw_data = open(url).read
        parsed_data = JSON.parse(raw_data)

              @results = parsed_data["results"]
              @first=@results[0]
              @geometry=@first["geometry"]
              @location=@geometry["location"]
              @lat=@location["lat"]
              @long=@location["lng"]
end

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


@event = Event.find(params[:id])

if Score.find_by user_id: current_user.id
  @current_score = Score.find_by user_id: current_user.id
else
  @current_score = Score.new
  @current_score.user_id = current_user.id
  @current_score.flakiness_score = 75
  @current_score.save
end




if @event.number_of_spots == 0
  redirect_to(:back, :alert=> "Sorry this event is full! Reach out to the creator to open up more spots.")
elsif @event.flakiness_bar && @event.flakiness_bar > @current_score.flakiness_score
  redirect_to(:back, :alert=> "Sorry you are too big of a flake for this event ;)")
else
    if @event.number_of_spots
    @event.number_of_spots = @event.number_of_spots - 1
    @event.save
    @response = @event.responses.find_by_user_id(current_user.id)

    @response.event_response = "Accepted"

    @current_score.flakiness_score = @current_score.flakiness_score + 1
    @current_score.save

    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Event has been accepted successfully.")
    else
      render("events.html.erb")
    end
  else
    @response = @event.responses.find_by_user_id(current_user.id)

    @response.event_response = "Accepted"

    @current_score.flakiness_score = @current_score.flakiness_score + 1
    @current_score.save

    save_status = @response.save

    if save_status == true
      redirect_to(:back, :notice => "Event has been accepted successfully.")
    else
      render("events.html.erb")
    end
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

      if @event.number_of_spots

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
    else
      @response = @event.responses.find_by_user_id(current_user.id)

      @response.event_response = "Rejected"

      save_status = @response.save

      if save_status == true
        redirect_to(:back, :notice => "Event has been rejected successfully.")
      else
        render("events.html.erb")
end
end

  @score = Score.find_by user_id: current_user.id

  if @event.date_time - Time.now >= 86400
    @score.flakiness_score = @score.flakiness_score - 2
    @score.save
  else
    @score.flakiness_score = @score.flakiness_score - 5
    @score.save
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

  def remove_invited


    @response = Response.where(user_id: params[:user_id], event_id: params[:id]).take
    @response.destroy
    @response.save


    redirect_to(:back, :notice => "User deleted.")

  end

  def send_simple_message

  @event = Event.find(params[:id])

@event.responses.each do |response|

    RestClient.post "https://api:key-d2d7469c797de7837080759482b47f00"\
    "@api.mailgun.net/v3/sandbox9ee08d75de414c67b7de10bd6ea8bb1b.mailgun.org/messages",
    :from => "#{@event.user.email} <postmaster@sandbox9ee08d75de414c67b7de10bd6ea8bb1b.mailgun.org>",
    :to => "Placeholder Username <#{response.user.email}>",
    :subject => "Hello Adam, you have just been invited to a #{@event.title} on SchedDash",
    :text => "You have been invied to the following event: #{@event.title}, to be held on #{@event.date_time}. Please visit http://localhost:3000 to accept/reject the invite :)"
end

redirect_to(:back, :notice => "Invites sent successfully.")

  end



end
