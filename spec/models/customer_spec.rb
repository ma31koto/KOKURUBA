require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "データの保存" do
    subject { customer.valid? }
    let(:customer) { build(:customer) }

    context "データの保存" do
      it "有効なデータの保存" do
        expect(FactoryBot.build(:customer)).to be_valid
      end
    end

    context "バリデーションテスト" do
      it "名前が空欄" do
        customer.name = ""
        is_expected.to eq false
      end

      it "性別が空欄" do
        customer.gender = ""
        is_expected.to eq false
      end

      it "年齢が空欄" do
        customer.age = ""
        is_expected.to eq false
      end

      it "年齢が1未満" do
        customer.age = -1
        is_expected.to eq false
      end

      it "年齢が101以上" do
        customer.age = 101
        is_expected.to eq false
      end

      it "年齢が数値以外" do
        customer.age = "あ"
        is_expected.to eq false
      end

      it "メールアドレスが空欄" do
        customer.email = ""
        is_expected.to eq false
      end

      it "パスワードが空欄" do
        customer.password = ""
        is_expected.to eq false
      end
      
      it "自己紹介文が169文字以上" do
        customer.biography = Faker::Lorem.characters(number: 169)
        is_expected.to eq false
      end
    end

    context "データの一致" do
      it "パスワードの一致" do
        customer.password = "123456"
        customer.password_confirmation = "123456"
        is_expected.to eq true
      end

      it "パスワードの不一致" do
        customer.password = "123456"
        customer.password_confirmation = "123457"
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'customer(followers)モデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context 'customer(followings)モデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:followings).macro).to eq :has_many
      end
    end

  end
end
