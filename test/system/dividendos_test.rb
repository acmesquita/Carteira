require "application_system_test_case"

class DividendosTest < ApplicationSystemTestCase
  setup do
    @dividendo = dividendos(:one)
  end

  test "visiting the index" do
    visit dividendos_url
    assert_selector "h1", text: "Dividendos"
  end

  test "creating a Dividendo" do
    visit dividendos_url
    click_on "New Dividendo"

    fill_in "Descricao", with: @dividendo.descricao
    fill_in "Pago", with: @dividendo.pago
    fill_in "Valor", with: @dividendo.valor
    click_on "Create Dividendo"

    assert_text "Dividendo was successfully created"
    click_on "Back"
  end

  test "updating a Dividendo" do
    visit dividendos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @dividendo.descricao
    fill_in "Pago", with: @dividendo.pago
    fill_in "Valor", with: @dividendo.valor
    click_on "Update Dividendo"

    assert_text "Dividendo was successfully updated"
    click_on "Back"
  end

  test "destroying a Dividendo" do
    visit dividendos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dividendo was successfully destroyed"
  end
end
