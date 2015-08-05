class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update, :destroy]
 
  def index
    @comments = Comment.all
  end

  def edit
  end

   def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comments_path, notice: 'Comment was successfully updated.' }
        format.json { render :index, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  


  def show
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.status = "draft"
    @comment.save
    redirect_to @commentable, notice: "Twój komentarz został wysłany do moderacji."

  end

  def moderation 
    @comments = Comment.where(status:  "draft")
    @approved = Comment.where(status:  "approved")
  end

  def approve
    Comment.update_all({status: "approved"}, {id: params[:comment_ids]})
    redirect_to comments_index_path
  end

  def set_comment
      @comment = Comment.find(params[:id])
  end
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :status)
    end
 

end
