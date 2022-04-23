require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe "データの保存" do
    subject { post_tag.valid? }

    let(:post_tag) { build(:post_tag) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:post_tag)).to be_valid
    end

    context "空白のバリデーション" do
      it "post_idがない場合" do
        post_tag.post_id = ""
        is_expected.to eq false
      end

      it "tag_idがない場合" do
        post_tag.tag_id = ""
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
