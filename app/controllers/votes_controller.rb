class VotesController < ApplicationController
  def create
    current_user.votes.create(vote_params)
    redirect_to dishes_path
  end

  private

  def vote_params
    params.require(:vote).permit(:dish_id, :status)
  end
end
