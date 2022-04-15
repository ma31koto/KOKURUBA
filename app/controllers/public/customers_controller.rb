class Public::CustomersController < ApplicationController
  before_action :ensure_correct_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "会員の情報が更新されました!"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会しました。"
  end

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :name, :gender, :age, :biography)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end
end
