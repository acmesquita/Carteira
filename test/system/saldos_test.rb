require "application_system_test_case"

class SaldosTest < ApplicationSystemTestCase
  setup do
    @saldo = saldos(:one)
  end

  test "visiting the index" do
    visit saldos_url
    assert_selector "h1", text: "Saldos"
  end

  test "creating a Saldo" do
    visit saldos_url
    click_on "New Saldo"

    fill_in "Banco", with: @saldo.banco_id
    fill_in "Data", with: @saldo.data
    fill_in "Valor", with: @saldo.valor
    click_on "Create Saldo"

    assert_text "Saldo was successfully created"
    click_on "Back"
  end

  test "updating a Saldo" do
    visit saldos_url
    click_on "Edit", match: :first

    fill_in "Banco", with: @saldo.banco_id
    fill_in "Data", with: @saldo.data
    fill_in "Valor", with: @saldo.valor
    click_on "Update Saldo"

    assert_text "Saldo was successfully updated"
    click_on "Back"
  end

  test "destroying a Saldo" do
    visit saldos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saldo was successfully destroyed"
  end
end
