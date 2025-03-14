class BooksController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @pagy, @books = pagy_countless(Book.all, items: 8)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @book = resource

    authorize @book
  end

  def new
    @book = Book.new
    @book.rewards.build
    @genres = genres
  end

  def create
    @book = Book.build(book_params)
    if @book.save
      if params['book'] && params['book']['tag_ids']
        params['book']['tag_ids'].each do |id|
          Book.last.genres << Genre.find_by(id:)
        end
      end

      redirect_to book_path(current_user.books.last.id)
    else
      render 'new'
    end
  end

  def edit
    @book = resource

    authorize @book

    @genres = genres
  end

  private

  def resource
    Book.find(params[:id])
  end

  def genres
    @genres = '['
    Genre.all.each do |genre|
      @genres += "{\"value\": \"#{genre.id}\", \"text\": \"#{genre.name}\"},"
    end
    @genres = @genres.chop
    @genres += ']'
  end

  def book_params
    params.require(:book).permit(
      :book_url,
      :name,
      :short_description,
      :video_url,
      :cover,
      :illustrations,
      :long_description,
      :language,
      rewards_attributes: %i[description donation_size item_name picture]
    ).merge(user_id: current_user.id)
  end
end
