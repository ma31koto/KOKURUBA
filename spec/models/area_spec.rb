require 'rails_helper'

RSpec.describe Area, type: :model do
  describe "データの保存" do
    subject { area.valid? }
    let(:area) { create(:area) }

    it "有効なデータの保存" do
      expect(FactoryBot.build(:area)).to be_valid
    end

    context "空白のバリデーション" do
      it "エリア名が空欄" do
        area.name = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Area.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end
