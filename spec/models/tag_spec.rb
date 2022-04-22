require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "データの保存" do
    subject { tag.valid? }

    let(:tag) { create(:tag) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:tag)).to be_valid
    end

    context "空白のバリデーション" do
      it "タグ名が空欄" do
        tag.name = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'PostTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:post_tags).macro).to eq :has_many
      end
    end
  end
end
