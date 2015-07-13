RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = %w(Game GameMode GameSession User Role SiteNews)
  
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.has_role?(:admin) || current_user.has_role?(:mod)
  end
  
  config.model "Role" do
    visible false
  end
  
  config.model "SiteNews" do
    edit do
      field :title
      field :body, :ck_editor
      field :user
    end
  end
  
  config.model "User" do
    object_label_method do
      :user_name
    end
    edit do
      field :user_name
      field :email
      field :password
      field :password_confirmation
      field :reset_password_sent_at, :datetime
      field :remember_created_at, :datetime
      field :sign_in_count
      field :current_sign_in_at
      field :last_sign_in_at
      field :current_sign_in_ip
      field :last_sign_in_ip
      field :time_zone
      field :xbox_name
      field :steam_name
      field :twitch_name
      field :avatar
      field :game_sessions
      field :role do
        visible do
          bindings[:view]._current_user.has_role?(:admin)
        end
      end
    end
  end
end
