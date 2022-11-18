class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
    # @users = User.all
    render 'index'
    # @single_room=Room.all
  end

  def room_table
    @rooms = Room.public_rooms
  end

  def show
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    @users = User.all_except(current_user)
    render 'index'
  end


  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render :edit
    end
  end


  def room
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else 
      render :room
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
