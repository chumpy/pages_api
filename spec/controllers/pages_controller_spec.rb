require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do
    it "is successful" do
      get :index, format: :xml
      response.should be_success
    end

    it "assigns @page" do
      get :index, format: :xml
      assigns(:pages).should_not be_nil
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @page = FactoryGirl.create :page
    end

    it 'is successful' do
      get :show, :id => @page.id, format: :xml
      response.should be_success
    end

    it "assigns @page" do
      get :show, :id => @page.id, format: :xml
      assigns(:page).should_not be_nil
    end
  end  
  describe "GET 'new'" do
    it 'is successful' do
      get :new, format: :xml
      response.should be_success
    end

    it "assigns @page" do
      get :new, format: :xml
      assigns(:page).should_not be_nil
    end
  end  
  describe "POST 'create'" do
    before(:each) do
      @page = Page.new
      @page.stub(:id).and_return(1)
    end

    context "The save is successful" do
      before(:each) do
        Page.should_receive(:new).and_return(@page)
        @page.should_receive(:save).and_return(true)
      end
    end

    context "the save fails" do
      before(:each) do
        @page.should_receive(:save).and_return(false)
        Page.should_receive(:new).and_return(@page)
      end

      it "assigns @page" do
        post :create, :page => @page.attributes, format: :xml
        assigns(:page).should_not be_nil
      end
    end
  end  
  describe "GET 'edit'" do
    before(:each) do
      @page = FactoryGirl.create :page
    end

    it 'is successful' do
      get :edit, :id => @page.id, format: :xml
      response.should be_success
    end

    it "assigns @page" do
      get :edit, :id => @page.id, format: :xml
      assigns(:page).should_not be_nil
    end
  end  
  describe "PUT 'update'" do
    before(:each) do
      @page = FactoryGirl.build :page
    end

    context "the update is successful" do
      before(:each) do
        @page.should_receive(:update_attributes).and_return(true)
        Page.should_receive(:find).with(@page.id).and_return(@page)
      end

    end

    context "the update fails" do
      before(:each) do
        @page.should_receive(:update_attributes).and_return(false)
        Page.should_receive(:find).with(@page.id).and_return(@page)
      end

    end
  end  
  describe "DELETE 'destroy'" do
    before(:each) do
      @page = FactoryGirl.create :page
      Page.should_receive(:find).with("#{@page.id}").and_return(@page)
    end

    it "should delete the page" do
      @page.should_receive(:destroy).and_return(true)
      delete :destroy, :id => @page.id, format: :xml
    end
  end
  describe "published queries" do
    before(:each) do
      @published_page = FactoryGirl.create(:page, published_on: Date.today - 1.day)
      @unpublished_page = FactoryGirl.create(:page, published_on: nil)
    end

    describe "GET 'published'" do
      it "should only return the published page" do
        get :published, format: :xml
        expect(assigns(:pages)).to eq(Array(@published_page))
      end
    end

    describe "GET 'unpublished'" do
      it "should only return the unpublished page" do
        get :unpublished, format: :xml
        expect(assigns(:pages)).to eq(Array(@unpublished_page))
      end
    end
  end

  describe "POST 'publish'" do
    it "should publish the page" do
      page = FactoryGirl.create :page, published_on: nil, title: "foo bar", content: "foo bar"
      post :publish, id: page.id, format: :json
      assigns(:page).published_on.should be
    end
  end

  describe "GET 'total_words'" do
    it "should return the total for the page" do
      page = FactoryGirl.create :page, published_on: nil, title: "foo bar", content: "foo bar"
      get :total_words, format: :json, id: page.id
      expect(assigns(:total_words)).to eq({"total_words" => 4})
    end  
  end
end
