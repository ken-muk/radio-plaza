require 'rails_helper'

RSpec.describe Station, type: :model do
  before do
    @station = build(:station)
  end

  describe 'バリデーション' do
    it '全カラムが設定されていればOK' do
      expect(@station.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @station.name = ''
      expect(@station.valid?).to eq(false)
    end

    it 'broadcast_typeが空だとNG' do
      @station.broadcast_type = ''
      expect(@station.valid?).to eq(false)
    end
  end
end
