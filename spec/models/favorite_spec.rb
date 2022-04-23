require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "データの保存" do
    subject { favorite.valid? }

    let(:favorite) { build(:favorite) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:favorite)).to be_valid
    end

    context "空白のバリデーション" do
      it "post_idがない場合" do
        favorite.post_id = ""
        is_expected.to eq false
      end

      it "customer_idがない場合" do
        favorite.customer_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end
