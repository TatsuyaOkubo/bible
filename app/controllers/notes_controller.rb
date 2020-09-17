class NotesController < ApplicationController
  def index
    @notes = Note.order('created_at DESC')
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

  private

  def note_params
    params.require(:note).permit(:note_name, :text).merge(user_id: current_user.id)
  end
end
