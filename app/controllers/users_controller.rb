class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit

    @user = User.find(params[:id])

  end


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def update

    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save

    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    else
      @users = User.all
      render :edit
    end

  end

private

  def user_params

    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_session_path
    end
  end

end
