class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      redirect_to transactions_path
    else
      flash.now[:error] = @transaction.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    per_page = 3
    @pg = params[:pg].to_i || 1
    @total_pages = Transaction.count/per_page
    @transactions = Transaction.order("transaction_date DESC").limit(per_page).offset(@pg * per_page - per_page)
  end

  def show
  end
end
