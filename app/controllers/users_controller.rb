class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @lists = @user.lists
  end

  def edit
    @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:name_family, :name_first, :profile, :hamdle_name, :birth_year, :birth_month, :birth_day, :age)
  end

end
