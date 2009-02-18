class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.xml
  def index
    @period = Period.find(params[:period_id])
    @transactions = @period.transactions
    @transaction = Transaction.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    @period = Period.find(params[:period_id])
    @transaction = @period.transactions.build(params[:transaction])

    respond_to do |format|
      if @transaction.save
        flash[:success] = 'Transaction was successfully created.'
        format.html { redirect_to(period_transactions_path(@transaction.period)) }
      else
        flash[:error] = @transaction.errors.full_messages.to_sentence
        format.html { redirect_to(period_transactions_path(@transaction.period)) }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[:success] = 'Transaction was successfully updated.'
        format.html { redirect_to(period_transactions_path(@transaction.period)) }
        format.xml  { head :ok }
      else
        flash[:error] = @transaction.errors.full_messages.to_sentence
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @period = @transaction.period
    @transaction.destroy

    respond_to do |format|
      flash[:success] = 'Transaction was successfully deleted.'
      format.html { redirect_to(period_transactions_path(@period)) }
      format.xml  { head :ok }
    end
  end
end
