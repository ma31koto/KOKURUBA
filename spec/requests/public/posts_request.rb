require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "スポットテスト" do
    before do
      @customer = FactoryBot.create(:customer)
    end

    context "スポット投稿画面" do
      it "ログインユーザーの場合" do
        sign_in @customer
        get '/posts/new'
        expect(response).to be_successful
      end

      it "ゲストユーザーの場合" do
        get '/posts/new'
        expect(response).to have_http_status(302)
      end
    end

    it "スポット詳細画面" do
      @post = FactoryBot.create(:post)
      get post_path(@post)
      expect(response).to be_successful
    end

    context "スポット投稿アクション" do
        it "ログインユーザーの場合" do
          sign_in @customer
          post "/posts", :params => { :post => { :title => "test", :body => "test", :user_id => 1}} #どうすればいい？
          expect(response).to have_http_status(200)
        end
        it "ゲストユーザーの場合" do
          post "/posts"
          expect(response).to have_http_status(401)
        end
    end

  end
end