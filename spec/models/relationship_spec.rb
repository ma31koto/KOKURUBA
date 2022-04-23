require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "データの保存" do
    subject { post_tag.valid? }

    let(:relationship) { build(:relationship) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:relationship)).to be_valid
    end

    context "空白のバリデーション" do
      it "follower_idがない場合" do
        relationship.follower_id = ""
        is_expected.to eq false
      end

      it "followed_idがない場合" do
        relationship.followed_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'customer(follower)モデルとの関係' do
      it 'N:1となっている' do
        expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
      end
    end

    context 'customer(followed)モデルとの関係' do
      it 'N:1となっている' do
        expect(Relationship.reflect_on_association(:followed).macro).to eq :belongs_to
      end
    end
  end
end
