require "cancan/matchers"

module ControllerMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
			admin_role = Role.create!(name: "admin")
			user.roles << admin_role
      sign_in user
    end
  end
end
