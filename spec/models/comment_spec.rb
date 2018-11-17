require 'rails_helper'

describe Comment do
  context "when the product has comments" do

        before do
          @user = FactoryBot.create(:user)
        end
        let(:product){ Product.create!(name: "Bicycle")}
        let(:comment) {Comment.create(user_id: @user.id, product_id: product.id, body: "A sample bike description")}

        it "is not valid without a rating" do
         comment.rating = nil
         expect(comment).to_not be_valid
        end

        it "is not valid without a body" do
         comment.body = nil
         expect(comment).to_not be_valid
        end

        it "is not valid without a product" do
         expect(product.comments.new(user_id: @user.id, product_id: nil, body: "A sample bike description")).to_not be_valid
        end

        it "is not valid without a user" do
         expect(product.comments.new(user_id: nil, product_id: product.id, body: "A sample bike description")).to_not be_valid
        end

        it "is valid with all info" do
         expect(product.comments.new(user_id: @user.id, product_id: product.id, body: "A sample bike description", rating:5)).to be_valid
        end

   end
end
