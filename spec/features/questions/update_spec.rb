require "rails_helper"
require 'pry'

RSpec.describe "Update a question" do
  context "Question exists" do
    it "shows the question" do
      question = RatingQuestion.create!(title: "hola")
      visit "/rating_questions/#{question["id"]}/edit"
      fill_in "Title", with: "Is Capybara Cool?"
      click_button "Update Rating question"

      within(".questions") do
        expect(page).to have_content("Is Capybara Cool?")
      end
      within(".flash-notice") do
        expect(page).to have_content("Your question has been updated.")
      end
    end
  end

  # context "Question doesn't exit" do
  #   it "returns 404" do
  #     visit "/rating_questions/it_never_exist/edit"
  #     expect(page.status_code).to eq(404)
  #   end
  # end
end
