class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      redirect_to transactions_path
    else
      flash[:error] = @transaction.errors.full_messages
      render 'new'
    end
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end
end
