require 'rails_helper'

RSpec.describe Song, type: :model do
  before do
    @song = build(:song)
  end

  describe 'バリデーション' do
    it '全カラムが設定されていればOK' do
      expect(@song.valid?).to eq(true)
    end

    it 'titleが空だとNG' do
      @song.title = ''
      expect(@song.valid?).to eq(false)
    end

    it 'artistが空だとNG' do
      @song.artist = ''
      expect(@song.valid?).to eq(false)
    end

    it 'song_typeが空だとNG' do
      @song.song_type = ''
      expect(@song.valid?).to eq(false)
    end
  end
end
