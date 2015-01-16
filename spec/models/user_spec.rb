require 'rails_helper'
	RSpec.describe User do 
		it "validates that the user email exists" do
			@user = User.new(
				name:'joseph',
				email: nil,
				username:'Coolkat',
				password:'password',
				password_confirmation:'password'
				)
			expect(@user.valid?).to eq(false)
		end
	end
