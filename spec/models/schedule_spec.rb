require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe '行きたい場所新規作成' do
    context '新規作成できるとき' do
      it '行きたい場所タイトルの入力が存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
    end

    context '新規作成できないとき' do
      it 'タイトルが空だと登録できない' do
        @schedule.title = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Title can't be blank")
      end

      it 'roomが紐付いていないと登録できない' do
        @schedule.room = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Room must exist")
      end

      it 'userが紐付いていないと登録できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("User must exist")
      end

      it 'descriptionが空でも登録できる' do
        @schedule.description = nil
        expect(@schedule).to be_valid
      end

      it 'start_timeが空でも登録できる' do
        @schedule.start_time = nil
        expect(@schedule).to be_valid
      end

      it 'end_timeが空でも登録できる' do
        @schedule.end_time = nil
        expect(@schedule).to be_valid
      end

      it '参考URLが空でも登録できる' do
        @schedule.reference_url = nil
        expect(@schedule).to be_valid
      end

      it 'コストが空でも登録できる' do
        @schedule.cost = nil
        expect(@schedule).to be_valid
      end

    end
  end
end