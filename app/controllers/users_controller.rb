class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
  def my_friends
    @friends = current_user.friends
  end
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find User"
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a User Email or name to search"
        format.js { render partial: 'users/friend_result' }
      end
    end

  end
end
