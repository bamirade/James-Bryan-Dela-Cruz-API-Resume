require 'simplecov'
SimpleCov.start 'rails'

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  subject(:feedback) { build(:feedback) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(feedback).to be_valid
    end

    it 'is not valid without an email' do
      feedback.email = nil
      feedback.valid?

      expect(feedback.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an invalid email format' do
      feedback.email = 'invalid_email'
      feedback.valid?

      expect(feedback.errors[:email]).to include('is invalid')
    end

    it 'is not valid without a message' do
      feedback.message = nil
      feedback.valid?

      expect(feedback.errors[:message]).to include("can't be blank")
    end

    it 'is not valid with a message less than 6 characters' do
      feedback.message = 'Short'
      feedback.valid?

      expect(feedback.errors[:message]).to include('is too short (minimum is 6 characters)')
    end

    it 'is not valid with a message longer than 600 characters' do
      feedback.message = 'a' * 601
      feedback.valid?

      expect(feedback.errors[:message]).to include('is too long (maximum is 600 characters)')
    end
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:feedback)).to be_valid
    end
  end
end
