require 'spec_helper'

describe Page do
  context "There are published and unpublished pages" do
    before(:each) do
      @published_page = FactoryGirl.create(:page, published_on: Date.today - 1.day)
      @published_page2 = FactoryGirl.create(:page, published_on: Date.today - 2.day)
      @unpublished_page = FactoryGirl.create(:page, published_on: nil)
      @unpublished_page2 = FactoryGirl.create(:page, published_on: Date.today + 1.day)
    end
    
    describe "published" do
      it "should only return the published page" do
        pages = Page.published
        expect(pages).to eq([@published_page, @published_page2])
      end
    end

    describe "unpublished" do
      it "should return the unpublished pages" do
        pages = Page.unpublished
        expect(pages).to eq([@unpublished_page2, @unpublished_page])
      end
    end

  end

  describe "total_words" do
    it "should return the number of words in the title and content combined" do
      page = FactoryGirl.build :page, title: "Lorem Lorem", content: "Ipsum ipsum foo bar"
      expect(page.total_words).to eq(6)
    end
  end

end
