class RequestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = @user.recieved_requests.paginate(page: params[:page])

  end

  def create
    @user = User.find(params[:reciever_id])
    current_user.send_req(@user)
    redirect_to @user
  end

  def update
    Request.find_by(id: params[:id]).destroy
    fst_user = User.find(params[:first_user])

    if (params[:status] == 1.to_s)
      sec_user = User.find(params[:second_user])

      fst_user.friendships.create(friend_id: sec_user.id)
      sec_user.friendships.create(friend_id: fst_user.id)
    end

    redirect_to user_requests_path(fst_user)
  end

  def destroy
    @user = Request.find(params[:id]).reciever
    current_user.cancel_req(@user)
    redirect_to @user
  end
end
