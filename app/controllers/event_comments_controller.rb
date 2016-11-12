class EventCommentsController < ApplicationController
  def index
    @event_comments = EventComment.all

    render("event_comments/index.html.erb")
  end

  def show
    @event_comment = EventComment.find(params[:id])

    render("event_comments/show.html.erb")
  end

  def new
    @event_comment = EventComment.new

    render("event_comments/new.html.erb")
  end

  def create
    @event_comment = EventComment.new


    @event_comment.user_id = params[:user_id]

    @event_comment.event_id = params[:event_id]

    @event_comment.content = params[:content]



    save_status = @event_comment.save

    if save_status == true
      redirect_to(:back, :notice => "Event comment created successfully.")
    else
      render("event_comments/new.html.erb")
    end

  end

  def edit
    @event_comment = EventComment.find(params[:id])

    render("event_comments/edit.html.erb")
  end

  def update
    @event_comment = EventComment.find(params[:id])


    @event_comment.user_id = params[:user_id]

    @event_comment.event_id = params[:event_id]

    @event_comment.content = params[:content]



    save_status = @event_comment.save

    if save_status == true
      redirect_to(:back, :notice => "Event comment updated successfully.")
    else
      render("event_comments/edit.html.erb")
    end

  end

  def destroy
    @event_comment = EventComment.find(params[:id])

    @event_comment.destroy

    if URI(request.referer).path == "/event_comments/#{@event_comment.id}"
      redirect_to("/", :notice => "Event comment deleted.")
    else
      redirect_to(:back, :notice => "Event comment deleted.")
    end
  end
end
