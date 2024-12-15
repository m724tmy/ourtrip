require 'rails_helper'

RSpec.describe Location, type: :model do
  before do
    @location = FactoryBot.build(:location)
  end

  describe '行きたい場所新規作成' do
    context '新規作成できるとき' do
      it '行きたい場所タイトルの入力が存在すれば登録できる' do
        expect(@location).to be_valid
      end
    end

    context '新規作成できないとき' do
      it 'タイトルが空だと登録できない' do
        @location.title = ''
        @location.valid?
        expect(@location.errors.full_messages).to include("Title can't be blank")
      end

      it 'roomが紐付いていないと登録できない' do
        @location.room = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("Room must exist")
      end

      it 'userが紐付いていないと登録できない' do
        @location.user = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("User must exist")
      end

      it 'descriptionが空でも登録できる' do
        @location.description = nil
        expect(@location).to be_valid
      end

      it 'start_timeが空でも登録できる' do
        @location.start_time = nil
        expect(@location).to be_valid
      end

      it 'end_timeが空でも登録できる' do
        @location.end_time = nil
        expect(@location).to be_valid
      end

      it '参考URLが空でも登録できる' do
        @location.reference_url = nil
        expect(@location).to be_valid
      end

      it 'コストが空でも登録できる' do
        @location.cost = nil
        expect(@location).to be_valid
      end

    end
  end
end