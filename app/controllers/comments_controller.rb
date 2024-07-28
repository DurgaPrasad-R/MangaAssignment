class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_existing_comment, only: [:create]

  def create
    @manga = Manga.find(params[:manga_id])
    @comment = @manga.comments.build(comment_params.merge(user: current_user))
    
    if @comment.save
      redirect_to @manga, notice: 'Comment was successfully created.'
    else
      redirect_to @manga, alert: 'There was an error submitting your comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_existing_comment
    @manga = Manga.find(params[:manga_id])
    if @manga.comments.exists?(user: current_user)
      redirect_to @manga, alert: 'You have already commented on this manga.'
    end
  end
end
