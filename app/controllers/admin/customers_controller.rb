class Admin::CustomersController < ApplicationController
  before_action :ensure_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員の情報が更新されました"
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

  def ensure_customer
    @customer = Customer.find(params[:id])
  end

end
