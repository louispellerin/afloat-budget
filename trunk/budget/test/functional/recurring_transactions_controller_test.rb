require 'test_helper'

class RecurringTransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recurring_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recurring_transaction" do
    assert_difference('RecurringTransaction.count') do
      post :create, :recurring_transaction => { }
    end

    assert_redirected_to recurring_transaction_path(assigns(:recurring_transaction))
  end

  test "should show recurring_transaction" do
    get :show, :id => recurring_transactions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recurring_transactions(:one).id
    assert_response :success
  end

  test "should update recurring_transaction" do
    put :update, :id => recurring_transactions(:one).id, :recurring_transaction => { }
    assert_redirected_to recurring_transaction_path(assigns(:recurring_transaction))
  end

  test "should destroy recurring_transaction" do
    assert_difference('RecurringTransaction.count', -1) do
      delete :destroy, :id => recurring_transactions(:one).id
    end

    assert_redirected_to recurring_transactions_path
  end
end
