require "rails_helper"
require 'pry'

RSpec.describe "Show a question" do
  

  context "Question exists" do
    it "shows the question" do
      question = RatingQuestion.create!(title: "hola")
      visit "/rating_questions/#{question["id"]}"
    
      expect(page).to have_content(question.title)
    end
  end

  
end