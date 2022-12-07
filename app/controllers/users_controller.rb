class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit

    @user= User.find(params[:id])

  end

  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save

    flash[:notice] = "Book was successfully updated."
    redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end

  end

private

  def user_params

    params.require(:user).permit(:name, :profile_image)

  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

end
