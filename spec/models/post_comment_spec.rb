require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe "データの保存" do
    subject { post_comment.valid? }

    let(:post_comment) { build(:post_comment) }

    context "データの保存" do
      it "有効なデータの保存" do
        expect(FactoryBot.build(:post_comment)).to be_valid
      end
    end

    context "空白のバリデーション" do
      it "タイトルが空欄" do
        post_comment.title = ""
        is_expected.to eq false
      end

      it "コメントが空欄" do
        post_comment.comment = ""
        is_expected.to eq false
      end

      it "雰囲気が空欄" do
        post_comment.atmosphere_rate = ""
        is_expected.to eq false
      end

      it "人の少なさが空欄" do
        post_comment.few_people_rate = ""
        is_expected.to eq false
      end

      it "定番度が空欄" do
        post_comment.standard_rate = ""
        is_expected.to eq false
      end

      it "総合評価が空欄" do
        post_comment.all_rate = ""
        is_expected.to eq false
      end

      it "告白結果が空欄" do
        post_comment.confession_result = ""
        is_expected.to eq false
      end

      it "customer_idが空欄" do
        post_comment.customer_id = ""
        is_expected.to eq false
      end

      it "post_idが空欄" do
        post_comment.post_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
