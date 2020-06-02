require "rails_helper"
require 'pry'

RSpec.describe "GET /rating_questions/:id" do
  let(:new_title) { "helo i'm a title" }
  let(:new_tag) { "i'm a tag" } 
  let(:question) { RatingQuestion.create!(title: "hola") }

  before do
    get "/rating_questions/#{question.id}.json"
  end

  context "when the question exists" do
    it "returns a 200 OK" do
      expect(response.status).to eq(200)
    end

    it "returns a question" do
      expect(JSON.parse(response.body).is_a?(Hash)).to eq(true)
    end
  end

  context "asking to get a question that doesn't exist" do
    before do
      get("/rating_questions/i-will-never-exist.json")
    end

    it "returns a 404 Not Found" do
      expect(response.status).to eq(404)
    end
  end

  

end
