class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all



    render("friendships/index.html.erb")
  end

  def show
    @friendship = Friendship.find(params[:id])

    render("friendships/show.html.erb")
  end

  def new
    @friendship = Friendship.new
    @users = User.all 
    @my_friendships_s = current_user.friends_where_sender
    @my_friendships_r = current_user.friends_where_receiver

    render("friendships/new.html.erb")
  end

  def create
    @friendship = Friendship.new


    @friendship.user_id_1 = params[:user_id_1]

    @friendship.user_id_2 = params[:user_id_2]

    @friendship.relationship = params[:relationship]

    @friendship.message = params[:message]

    @friendship.status = params[:status]


    save_status = @friendship.save

    if save_status == true
      redirect_to(:back, :notice => "Friendship created successfully.")
    else
      render("friendships/new.html.erb")
    end

  end

  def edit
    @friendship = Friendship.find(params[:id])

    render("friendships/edit.html.erb")
  end

  def update
    @friendship = Friendship.find(params[:id])


    @friendship.user_id_1 = params[:user_id_1]

    @friendship.user_id_2 = params[:user_id_2]

    @friendship.relationship = params[:relationship]



    save_status = @friendship.save

    if save_status == true
      redirect_to(:back, :notice => "Friendship updated successfully.")
    else
      render("friendships/edit.html.erb")
    end

  end

  def accept
    @friendship = Friendship.find(params[:id])

    @friendship.status = 1

    save_status = @friendship.save

    if save_status == true
      redirect_to(:back, :notice => "Friend added successfully.")
    else
      render("friendships.html.erb")
    end

  end

  def destroy
    @friendship = Friendship.find(params[:id])

    @friendship.destroy

    if URI(request.referer).path == "/friendships/#{@friendship.id}"
      redirect_to("/", :notice => "Friendship deleted.")
    else
      redirect_to(:back, :notice => "Friendship deleted.")
    end
  end
end
