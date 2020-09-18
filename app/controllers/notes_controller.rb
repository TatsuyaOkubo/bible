class NotesController < ApplicationController
  before_action :all_note, only: [:index, :dust]
  before_action :set_note, only: [:edit, :update, :throw]
  before_action :move_to_session

  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def throw
    if @note.trash
      @note.update(trash: false)
    else
      @note.update(trash: true)
    end

    box = Note.find(params[:id])
    render json: { post: box }
    ActionCable.server.broadcast 'display_channel', content: @note
  end

  def dust
  end

  private

  def note_params
    params.require(:note).permit(:note_name, :text).merge(user_id: current_user.id)
  end

  def all_note
    @notes = Note.order('created_at DESC')
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
    end
end
