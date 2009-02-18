class RecurringTransactionsController < ApplicationController
  # GET /recurring_transactions
  # GET /recurring_transactions.xml
  def index
    @recurring_transactions = RecurringTransaction.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recurring_transactions }
    end
  end

  # GET /recurring_transactions/1
  # GET /recurring_transactions/1.xml
  def show
    @recurring_transaction = RecurringTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recurring_transaction }
    end
  end

  # GET /recurring_transactions/new
  # GET /recurring_transactions/new.xml
  def new
    @recurring_transaction = RecurringTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recurring_transaction }
    end
  end

  # GET /recurring_transactions/1/edit
  def edit
    @recurring_transaction = RecurringTransaction.find(params[:id])
  end

  # POST /recurring_transactions
  # POST /recurring_transactions.xml
  def create
    @recurring_transaction = RecurringTransaction.new(params[:recurring_transaction])

    respond_to do |format|
      if @recurring_transaction.save
        flash[:succes] = 'Recurring transaction was successfully created.'
        format.html { redirect_to(@recurring_transaction) }
        format.xml  { render :xml => @recurring_transaction, :status => :created, :location => @recurring_transaction }
      else
        flash[:error] = @recurring_transaction.errors.full_messages.to_sentence
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurring_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recurring_transactions/1
  # PUT /recurring_transactions/1.xml
  def update
    @recurring_transaction = RecurringTransaction.find(params[:id])

    respond_to do |format|
      if @recurring_transaction.update_attributes(params[:recurring_transaction])
        flash[:success] = 'Recurring transaction was successfully updated.'
        format.html { redirect_to(@recurring_transaction) }
        format.xml  { head :ok }
      else
        flash[:error] = @recurring_transaction.errors.full_messages.to_sentence
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurring_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recurring_transactions/1
  # DELETE /recurring_transactions/1.xml
  def destroy
    @recurring_transaction = RecurringTransaction.find(params[:id])
    @recurring_transaction.destroy

    respond_to do |format|
      flash[:success] = 'Recurring transaction was successfully deleted.'
      format.html { redirect_to(recurring_transactions_url) }
      format.xml  { head :ok }
    end
  end
end
