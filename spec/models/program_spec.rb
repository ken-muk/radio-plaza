require 'rails_helper'

RSpec.describe Program, type: :model do
  before do
    @program = build(:program)
  end

  describe 'バリデーション' do
    it '全カラムが設定されていればOK' do
      expect(@program.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @program.name = ''
      expect(@program.valid?).to eq(false)
    end

    it 'dayが空だとNG' do
      @program.day = ''
      expect(@program.valid?).to eq(false)
    end

    it 'timeが空だとNG' do
      @program.time = ''
      expect(@program.valid?).to eq(false)
    end

    it 'start_yearが空だとNG' do
      @program.start_year = ''
      expect(@program.valid?).to eq(false)
    end

    it 'end_yearが空だとNG' do
      @program.end_year = ''
      expect(@program.valid?).to eq(false)
    end

    it 'ongoingがnilだとNG' do
      @program.ongoing = nil
      expect(@program.valid?).to eq(false)
    end

    it 'emailは空でもOK' do
      @program.email = ''
      expect(@program.valid?).to eq(true)
    end

    it 'official_urlは空でもOK' do
      @program.official_url = ''
      expect(@program.valid?).to eq(true)
    end

    it 'recommend_pointは空でもOK' do
      @program.recommend_point = ''
      expect(@program.valid?).to eq(true)
    end
  end
end
