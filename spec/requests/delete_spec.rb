require "spec_helper"

RSpec.describe "DELETE /rating_questions/:id" do
  context "when the question exists" do
    let(:question) { RatingQuestion.create!(title: "Hello World") }
    
    before do
      get "/rating_questions/#{question["id"]}.json" 
    end

    it "returns a 200 OK" do
      expect(response.status).to eq(200)
    end

    it "returns a question" do
      expect(JSON.parse(response.body).is_a?(Hash)).to eq(true)
    end
  end

  context "asking to get a question that doesn't exist" do
    before do
      get "/rating_questions/i-will-never-exist"
    end

    it "returns a 404 Not Found" do
      expect(response.status).to eq(404)
    end
  end

  # ---

  context "with an existing question" do
    let(:question) { RatingQuestion.create!(title: "Hello World") }

    before do
      delete "/rating_questions/#{question["id"]}.json"
    end

    it "returns a 204 No Content" do
      expect(response.status).to eq(204)
    end

    it "returns nothing" do
      expect(response.body.to_s).to eq('')
    end
  end

end
