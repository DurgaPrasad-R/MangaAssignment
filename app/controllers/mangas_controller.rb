class MangasController < ApplicationController
  def new
    @manga = Manga.new
  end

  def create
    @manga = Manga.new(manga_params)
    
    if params[:manga][:cover_image].present?
      upload = Cloudinary::Uploader.upload(params[:manga][:cover_image].tempfile.path)
      @manga.cover_image = upload['public_id']
    end

    if @manga.save
      redirect_to @manga, notice: 'Manga was successfully created.'
    else
      render :new
    end
  end

  def show
    @manga = Manga.find(params[:id])
  end

  private

  def manga_params
    params.require(:manga).permit(:title, :author, :description, :published_date, :user_id, :cover_image)
  end
end
