require 'spec_helper'

describe Page do
  context "There are published and unpublished pages" do
    before(:each) do
      @published_page = FactoryGirl.create(:page, published_on: Date.today - 1.day)
      @unpublished_page = FactoryGirl.create(:page, published_on: nil)
      @unpublished_page2 = FactoryGirl.create(:page, published_on: Date.today + 1.day)
    end
    
    describe "published" do
      it "should only return the published page" do
        pages = Page.published
        expect(pages).to eq(Array(@published_page))
      end
    end

    describe "unpublished" do
      it "should return the unpublished pages" do
        pages = Page.unpublished
        expect(pages).to eq([@unpublished_page2, @unpublished_page])
      end
    end

  end

end
