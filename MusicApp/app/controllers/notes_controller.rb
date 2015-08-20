class NotesController < ApplicationController

  def create
    note = Note.new(note_params)
    note.track_id = params[:track_id]
    note.user_id = current_user.id
    flash[:errors] = note.errors.full_messages unless note.save
    redirect_to track_url(note.track)
  end

  def destroy
    note = Note.find(params[:id])
    track = note.track
    unless current_user.owns_note?(note)
      render text: "Bad user!  Don't delete others' notes", status: :forbidden
      return
    end
    note.destroy

    redirect_to track_url(track)
  end

  def note_params
    params.require(:note).permit(:user_id, :track_id, :note_text)
  end
end
