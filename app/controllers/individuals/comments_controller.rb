class Individuals::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Individual.find(params[:individual_id])
    end
end