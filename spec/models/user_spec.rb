require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = FactoryGirl.create(:user, first_name: 'Xing', last_name: 'Wei')
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "has a full name method that combines first and last names" do
      expect(@user.name).to eql("Wei, Xing")
    end
  end
end
