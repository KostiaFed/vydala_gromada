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
    @book.rewards.build

    @genres = '['
    Genre.all.each do |genre|
      @genres += "{\"value\": \"#{genre.id}\", \"text\": \"#{genre.name}\"},"
    end
    @genres = @genres.chop
    @genres += ']'
  end

  def create
    if current_user.books << Book.new(book_params)
      Book.last.genres << Genre.all.sample
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
    params.require(:book).permit!
  end
end
