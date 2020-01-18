require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature, js: true do
  let(:new_customer_form) {NewCustomerForm.new}
  
  describe 'Navigation' do
    it '#Index' do
    visit(customers_path)  
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
    end
    it "#Ajax" do
      visit(customers_path)
      click_link('Add Message')
      page.has_content?('Yes!')
    end
    it "#Find" do
      visit(customers_path)
      click_link('Add Message')
      expect(find('#my-div')).to have_content('Yes')
    end
    it '#New_Customer-Page Object Pattern' do
      new_customer_form.login.visit_page.fill_with(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        address: Faker::Address.street_address
      ).submit
      page.has_content?('/succesfully/')
      page.save_screenshot('screenshot.png')
    end
    it '#New_Customer' do
      member = create(:member)
      login_as(member, :scope => :member)
      visit(new_customer_path)  
      fill_in('Name', with: Faker::Name.name)
      fill_in('Email', with: Faker::Internet.email)
      fill_in('Address', with: Faker::Address.street_address)
      click_button('Create Customer')
      page.has_content?('/succesfully/')
    end
  end
end
