class NotesController < ApplicationController

  def new
    @note = Note.new
    @site = Site.find(params[:site_id])
  end

  def create
    @note = Note.new(note_params)
    @note.site = Site.find(params[:site_id])
    if @note.save
      redirect_to site_path(@note.site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to site_path(@note.site)
  end

  private

  def note_params
    params.require(:note).permit(:rich_content, :site_id, photos: [])
  end
end
