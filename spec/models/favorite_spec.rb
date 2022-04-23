require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "データの保存" do
    subject { favorite.valid? }

    let(:customer) { create(:customer) }
    let!(:post) { build(:post, member_id: member.id) }
    let!(:favorite) { build(:favorite, question_id: question.id, member_id: member.id) }

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
