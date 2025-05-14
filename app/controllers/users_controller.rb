class UsersController < ApplicationController
  def show
    @pagy, @books = pagy_countless(current_user.books, items: 8)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
