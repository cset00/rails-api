require "rails_helper"

RSpec.describe "deletes a question" do
  let!(:question) { RatingQuestion.create!(title: "hola") }

  context "question exists" do
    it "deletes the question" do
      visit "/"
      within("#question_#{question.id}") do
        click_link "Delete Question"
      end
      accept_confirm 

      within(".flash-notice") do
        expect(page).to have_content("Your question has been deleted.")
      end
    end
  end
end