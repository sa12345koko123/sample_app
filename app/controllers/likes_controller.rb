class LikesController < ApplicationController


  def create
    list = List.find(params[:list_id])
    like = current_user.likes.new(list_id: list.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    list = List.find(params[:list_id])
    like = current_user.likes.find_by(list_id: list.id)
    like.destroy
    redirect_to request.referer
  end

end
