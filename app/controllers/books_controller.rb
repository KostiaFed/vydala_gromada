class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @pagy, @books = pagy_countless(Book.all, items: 8)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end

  def show
    @book = resource
  end

  def new
    @book = Book.new
  end

  def create
    if current_user.books << Book.new(book_params)
      redirect_to book_path(current_user.books.last.id)
    else
      render 'new'
    end
  end

  def resource
    Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :descrition, :user_id)
  end
end
