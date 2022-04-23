require 'rails_helper'

RSpec.describe "PostComments", type: :request do
  describe "コメントテスト" do
    before do
      @customer = FactoryBot.create(:customer)
      @post = FactoryBot.create(:post)
    end

    context "コメント投稿画面" do
      it "ログインユーザーの場合" do
        sign_in @customer
        get '/post_comments/new'
        expect(response).to be_successful
      end

      it "ゲストユーザーの場合" do
        get '/pos_commentts/new'
        expect(response).to have_http_status(302)
      end
    end


    context "コメント詳細画面" do
      it "ログインユーザーの場合" do
        sign_in @customer
        @post_comment = FactoryBot.create(:post_comment)
        get post_path(@post_comment.post)
        expect(response).to be_successful
      end

      it "ゲストユーザーの場合" do
        @post_comment = FactoryBot.create(:post_comment)
        get post_path(@post_comment.post)
        expect(response).to be_successful
      end
    end


    context "スポット投稿アクション" do
      it "ログインユーザーの場合" do
        sign_in @customer
        post "/post_comments", :params => { :post => { :title => "test", :body => "test", :user_id => 1 } } # どうすればいい？
        expect(response).to have_http_status(200)
      end
      it "ゲストユーザーの場合" do
        post "/post_comments"
        expect(response).to have_http_status(401)
      end
    end


    context "コメント編輯画面" do
      it "ログインユーザーの場合" do
        sign_in @customer
        get '/post_comments/edit'
        expect(response).to be_successful
      end

      it "ゲストユーザーの場合" do
        get '/post_comments/edit'
        expect(response).to have_http_status(302)
      end
    end

    context "コメント編集アクション" do
      it "ログインユーザーの場合" do
        sign_in @customer
        patch "/post_comments", :params => { :post => { :title => "test", :body => "test", :user_id => 1 } } # どうすればいい？
        expect(response).to have_http_status(200)
      end
      it "ゲストユーザーの場合" do
        patch "/post_comments"
        expect(response).to have_http_status(401)
      end
    end


  end
end
