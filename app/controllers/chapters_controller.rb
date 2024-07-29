class ChaptersController < ApplicationController
  before_action :authenticate_user!
  def new
    @manga = Manga.find(params[:manga_id])
    @chapter = @manga.chapters.build
  end

  def create
    @manga = Manga.find(params[:manga_id])
    @chapter = @manga.chapters.build(chapter_params.except(:images))

    if params[:chapter][:images].present?
      uploaded_image_ids = params[:chapter][:images].map do |image|
        next if image.blank?

        upload = Cloudinary::Uploader.upload(image.tempfile.path)
        upload['public_id']
      end.compact

      @chapter.image_urls = uploaded_image_ids
    end

    if @chapter.save
      redirect_to [@manga,@chapter], notice: 'Chapter was successfully created.'
    else
      flash.now[:alert] = @chapter.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
    @manga = Manga.find(params[:manga_id])
    @images = Kaminari.paginate_array(@chapter.cloudinary_image_urls.reverse).page(params[:page]).per(1)
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :number, images: [])
  end
  
end
