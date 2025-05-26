class CommentsController < ApplicationController
  before_action :set_book

  def create    
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: 'Коментар додано!'
    else
      redirect_to @book, notice: 'Не вдалося зберегти коментар!'
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
