require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "スポットテスト" do
    before do
      @post = FactoryBot.create(:post)
      @customer = Customer.find(@post.customer_id)
      sign_in @customer
    end

    context "画面表示" do
      it "map_search" do
        get '/posts/map_search'
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "index" do
        get '/posts'
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "show" do
        get post_path(@post)
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "new" do
        get '/posts/new'
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end

      it "edit" do
        get edit_post_path(@post)
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    context "アクション" do
      it "create" do
        expect {
          post "/posts", :params => { :post => {
            :postal_code => "105-0011",
            :address => "東京都港区芝公園４丁目２−８",
            :longitude => 139.7454329,
            :latitude => 35.6585805,
            :title => "東京タワー",
            :introduction => "夜景が綺麗です！",
            :atmosphere_rate => 3.5,
            :few_people_rate => 3.5,
            :standard_rate => 3.5,
            :all_rate => 3.5,
            :confession_result => "yes",
            :area_id => 1,
            :name => "",
          }}
        }.to change(@customer.posts, :count).by(1)
      end

      it "not_create" do
        expect {
          post "/posts", :params => { :post => {
            :postal_code => nil,
            :address => "東京都港区芝公園４丁目２−８",
            :longitude => 139.7454329,
            :latitude => 35.6585805,
            :title => "東京タワー",
            :introduction => "夜景が綺麗です！",
            :atmosphere_rate => 3.5,
            :few_people_rate => 3.5,
            :standard_rate => 3.5,
            :all_rate => 3.5,
            :confession_result => "yes",
            :area_id => 1,
            :name => "",
          }}
        }.to_not change(@customer.posts, :count)
      end

      it "update" do
          patch "/posts/#{@post.id}", :params => { :post => {
            :name => "tag_test",
            :title => "title_test",
          }}
        expect(@post.tags.count).to eq 1
        expect(@post.tags[0].name).to eq "tag_test"
        expect(Post.find(@post.id).title).to eq "title_test"
      end

       it "not_update" do
          patch "/posts/#{@post.id}", :params => { :post => {
            :name => "tag_test",
            :title => "title_test",
            :address => ""
          }}
        expect(Post.find(@post.id).title).not_to eq "title_test"
      end

      it "destroy" do
        expect {
          delete "/posts/#{@post.id}"
        }.to change(@customer.posts, :count).by(-1)
      end
    end

  end
end
