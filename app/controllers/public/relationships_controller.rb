class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: [:create, :destroy, :followings, :followers]

  def create
    current_customer.follow(params[:customer_id])
    @relationship = Relationship.find_by(follower_id: @customer.id, followed_id: current_customer.id)
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
  end

  def followings
    @customers = @customer.followings
  end

  def followers
    @customers = @customer.followers
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end
end
