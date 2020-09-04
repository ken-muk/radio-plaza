require 'rails_helper'

RSpec.describe Corner, type: :model do
  before do
    @corner = build(:corner)
  end

  describe 'バリデーション' do
    it '全カラムが設定されていればOK' do
      expect(@corner.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @corner.name = ''
      expect(@corner.valid?).to eq(false)
    end

    it 'contentが空だとNG' do
      @corner.content = ''
      expect(@corner.valid?).to eq(false)
    end

    it 'subjectは空でもOK' do
      @corner.subject = ''
      expect(@corner.valid?).to eq(true)
    end
  end
end
