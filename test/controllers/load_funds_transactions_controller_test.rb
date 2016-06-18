require 'test_helper'

class LoadFundsTransactionsControllerTest < ActionController::TestCase
  setup do
    @load_funds_transaction = load_funds_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:load_funds_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create load_funds_transaction" do
    assert_difference('LoadFundsTransaction.count') do
      post :create, load_funds_transaction: {  }
    end

    assert_redirected_to load_funds_transaction_path(assigns(:load_funds_transaction))
  end

  test "should show load_funds_transaction" do
    get :show, id: @load_funds_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @load_funds_transaction
    assert_response :success
  end

  test "should update load_funds_transaction" do
    patch :update, id: @load_funds_transaction, load_funds_transaction: {  }
    assert_redirected_to load_funds_transaction_path(assigns(:load_funds_transaction))
  end

  test "should destroy load_funds_transaction" do
    assert_difference('LoadFundsTransaction.count', -1) do
      delete :destroy, id: @load_funds_transaction
    end

    assert_redirected_to load_funds_transactions_path
  end
end
