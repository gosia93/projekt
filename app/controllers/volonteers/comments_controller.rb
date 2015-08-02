class Volonteers::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Volonteer.find(params[:volonteer_id])
    end
end