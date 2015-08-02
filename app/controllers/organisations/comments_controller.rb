class Organisations::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Organisation.find(params[:organisation_id])
    end
end