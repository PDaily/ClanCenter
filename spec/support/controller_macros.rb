require "cancan/matchers"

module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
			user.admin!
      sign_in user
    end
  end
end
