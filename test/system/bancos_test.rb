require "application_system_test_case"

class BancosTest < ApplicationSystemTestCase
  setup do
    @banco = bancos(:one)
  end

  test "visiting the index" do
    visit bancos_url
    assert_selector "h1", text: "Bancos"
  end

  test "creating a Banco" do
    visit bancos_url
    click_on "New Banco"

    fill_in "Nome", with: @banco.nome
    fill_in "Tipo", with: @banco.tipo
    click_on "Create Banco"

    assert_text "Banco was successfully created"
    click_on "Back"
  end

  test "updating a Banco" do
    visit bancos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @banco.nome
    fill_in "Tipo", with: @banco.tipo
    click_on "Update Banco"

    assert_text "Banco was successfully updated"
    click_on "Back"
  end

  test "destroying a Banco" do
    visit bancos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Banco was successfully destroyed"
  end
end
