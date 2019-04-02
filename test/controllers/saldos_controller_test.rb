require 'test_helper'

class SaldosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saldo = saldos(:one)
  end

  test "should get index" do
    get saldos_url
    assert_response :success
  end

  test "should get new" do
    get new_saldo_url
    assert_response :success
  end

  test "should create saldo" do
    assert_difference('Saldo.count') do
      post saldos_url, params: { saldo: { banco_id: @saldo.banco_id, data: @saldo.data, valor: @saldo.valor } }
    end

    assert_redirected_to saldo_url(Saldo.last)
  end

  test "should show saldo" do
    get saldo_url(@saldo)
    assert_response :success
  end

  test "should get edit" do
    get edit_saldo_url(@saldo)
    assert_response :success
  end

  test "should update saldo" do
    patch saldo_url(@saldo), params: { saldo: { banco_id: @saldo.banco_id, data: @saldo.data, valor: @saldo.valor } }
    assert_redirected_to saldo_url(@saldo)
  end

  test "should destroy saldo" do
    assert_difference('Saldo.count', -1) do
      delete saldo_url(@saldo)
    end

    assert_redirected_to saldos_url
  end
end
