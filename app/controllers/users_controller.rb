class UsersController < ApplicationController
  def show
    @pagy, @books = pagy_countless(current_user.books, items: 8)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end
end
