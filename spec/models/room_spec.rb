require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム新規作成' do
    context '新規作成できるとき' do
      it 'ルームタイトル名の入力が存在すれば登録できる' do
        expect(@room).to be_valid
      end
    end

    context '新規作成できないとき' do
      it 'room_nameが空のとき登録できない' do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name can't be blank")
      end

      it 'descriptionが空でも登録できる' do
        @room.description = nil
        expect(@room).to be_valid
      end

      it 'start_timeが空でも登録できる' do
        @room.start_time = nil
        expect(@room).to be_valid
      end

      it 'end_timeが空でも登録できる' do
        @room.end_time = nil
        expect(@room).to be_valid
      end
    end
  end
end