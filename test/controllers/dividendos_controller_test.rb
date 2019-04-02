require 'test_helper'

class DividendosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dividendo = dividendos(:one)
  end

  test "should get index" do
    get dividendos_url
    assert_response :success
  end

  test "should get new" do
    get new_dividendo_url
    assert_response :success
  end

  test "should create dividendo" do
    assert_difference('Dividendo.count') do
      post dividendos_url, params: { dividendo: { descricao: @dividendo.descricao, pago: @dividendo.pago, valor: @dividendo.valor } }
    end

    assert_redirected_to dividendo_url(Dividendo.last)
  end

  test "should show dividendo" do
    get dividendo_url(@dividendo)
    assert_response :success
  end

  test "should get edit" do
    get edit_dividendo_url(@dividendo)
    assert_response :success
  end

  test "should update dividendo" do
    patch dividendo_url(@dividendo), params: { dividendo: { descricao: @dividendo.descricao, pago: @dividendo.pago, valor: @dividendo.valor } }
    assert_redirected_to dividendo_url(@dividendo)
  end

  test "should destroy dividendo" do
    assert_difference('Dividendo.count', -1) do
      delete dividendo_url(@dividendo)
    end

    assert_redirected_to dividendos_url
  end
end
