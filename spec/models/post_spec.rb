require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "データの保存" do
    subject { post.valid? }

    let(:post) { build(:post) }

    context "データの保存" do
      it "有効なデータの保存" do
        expect(FactoryBot.build(:post)).to be_valid
      end
    end

    context "空白のバリデーション" do
      it "郵便番号が空欄" do
        post.postal_code = ""
        is_expected.to eq false
      end

      it "住所が空欄" do
        post.address = ""
        is_expected.to eq false
      end

      it "経度が空欄" do
        post.longitude = ""
        is_expected.to eq false
      end

      it "緯度が空欄" do
        post.latitude = ""
        is_expected.to eq false
      end

      it "タイトルが空欄" do
        post.title = ""
        is_expected.to eq false
      end

      it "説明文が空欄" do
        post.introduction = ""
        is_expected.to eq false
      end

      it "雰囲気が空欄" do
        post.atmosphere_rate = ""
        is_expected.to eq false
      end

      it "人の少なさが空欄" do
        post.few_people_rate = ""
        is_expected.to eq false
      end

      it "定番度が空欄" do
        post.standard_rate = ""
        is_expected.to eq false
      end

      it "総合評価が空欄" do
        post.all_rate = ""
        is_expected.to eq false
      end

      it "告白結果が空欄" do
        post.confession_result = ""
        is_expected.to eq false
      end

      it "area_idが空欄" do
        post.area_id = ""
        is_expected.to eq false
      end

      it "customer_idが空欄" do
        post.customer_id = ""
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Areaモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:area).macro).to eq :belongs_to
      end
    end

    context 'PostTagモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_tags).macro).to eq :has_many
      end
    end
  end
end
