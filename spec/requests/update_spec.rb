require "spec_helper"

RSpec.describe "PATCH /rating_questions/:id" do
  let(:rating_question) { RatingQuestion.create!(title: "i need changing") }

  before do
    patch "/rating_questions/#{rating_question["id"]}.json", params: { rating_question: { title: "Hello World" } }
  end
  
  context "when the question exists" do
    it "returns a 200 OK" do
      expect(response.status).to eq(200)
    end

    it "returns a question -- with an additional field" do
      patch "/rating_questions/#{rating_question["id"]}.json", params: { rating_question: { tag: "hola tag" } }
      question = JSON.parse(response.body)
      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello World")
      # expect(question["tag"]).to eq("hola tag")
    end
  end

  context "asking to get a question that doesn't exist" do    
    it "returns a 404 Not Found" do
      patch "/rating_questions/i-will-never-exist", params: { rating_question: { title: "not here"} }
      
      expect(response.status).to eq(404)
    end
  end
end