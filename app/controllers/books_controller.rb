class BooksController < ApplicationController
  def index
    @pagy, @books = pagy_countless(Book.all, items: 8)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end
end
