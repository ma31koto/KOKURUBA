class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員の情報が更新されました!"
    else
      render :edit
    end
  end

  def list
    @customer = Customer.find(params[:customer_id])
    @post_comments = PostComment.where(customer_id: params[:customer_id])
  end

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :name, :gender, :age, :biography, :email, :is_deleted)
  end

end
