require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) {Question.create!(title:"New Question Title", body: "New Question Body", resolved: false)}
    let(:answer) {Answer.create!(body: "Question Body", question: question)}

    describe "atrributes" do
        it "has a title attribute" do
            expect(question).to have_attributes(title: "New Question Title", body: "New Question Body", resolved: false)
        end
    end
end
