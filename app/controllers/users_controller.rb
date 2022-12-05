class UsersController < ApplicationController
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

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
