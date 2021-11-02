class FriendshipsController < ApplicationController

  before_action :set_users, only: %i[create destroy]

  def create
    Request.find_by(sender_id: params[:friend].to_i).destroy
    # fst_user = User.find(current_user.id)
    # sec_user = User.find(params[:friend])

    @fst_user.friendships.create(friend_id: @sec_user.id)
    @sec_user.friendships.create(friend_id: @fst_user.id)

    redirect_to @sec_user
  end

  def destroy
    # first_user = User.find(current_user.id)
    # second_user = User.find(params[:friend])

    @fst_user.friendships.find_by(friend_id: @sec_user.id).destroy
    @sec_user.friendships.find_by(friend_id: @fst_user.id).destroy

    redirect_to @sec_user
  end

  private

  def set_users
    @fst_user = User.find(current_user.id)
    @sec_user = User.find(params[:friend])
  end
end
