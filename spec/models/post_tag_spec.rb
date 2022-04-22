require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe "データの保存" do
    subject { post_tag.valid? }

    let(:customer) { create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }
    let!(:tag) { create(:tag) }
    let!(:post_tag) { build(:post_tag, post_id: post.id, tag_id: tag.id) }

    context "空白のバリデーション" do
      it "post_idがない場合" do
        question_tag.question_id = ""
        is_expected.to eq false
      end

      it "tag_idがない場合" do
        question_tag.tag_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostTag.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'tagモデルとの関係' do
      it 'N:1となっている' do
        expect(PostTag.reflect_on_association(:tag).macro).to eq :belongs_to
      end
    end
  end
end
