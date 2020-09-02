require 'rails_helper'

RSpec.describe Personality, type: :model do
  before do
    @personality = build(:personality)
  end

  describe 'バリデーション' do
    it '全カラムが設定されていればOK' do
      expect(@personality.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @personality.name = ''
      expect(@personality.valid?).to eq(false)
    end

    it 'occupationが空だとNG' do
      @personality.occupation = ''
      expect(@personality.valid?).to eq(false)
    end

    it 'official_urlは空でもOK' do
      @personality.official_url = ''
      expect(@personality.valid?).to eq(true)
    end
  end
end
