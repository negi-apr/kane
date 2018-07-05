class PaymentController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment = Payment.new
    @payment.transactions.build
    @group = Group.find(params[:group_id])
    @group_users = @group.group_users
  end

  def create
    @payment = Payment.new(payment_params)
    #@payment.transactions.build
    binding.pry


  end

  def history

  end

  private
  def payment_params
    params.require(:payment).permit(
      :user_id, :group_id, :from, :to, :amount, :description, :resolved, :deleted,
      transactions_attributes: [:id, :payment_id, :from_id, :to_id, :resolved, :deleted, :ids]
    )
  end
end
