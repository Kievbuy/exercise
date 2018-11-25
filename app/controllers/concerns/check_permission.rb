module CheckPermission
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
    before_action :check_permission
  end

  def permissions
    {
        articles: {
            reader: [:index, :show],
            writer: [:create, :update, :index, :show],
            admin: []
        },

        users: {
            admin: [:create, :update, :index, :show, :destroy]
        }
    }
  end

  def check_permission
    binding.pry
    controller_permissions = permissions[controller_name.to_sym]
    roles = current_user.roles.pluck(:name).map &:to_sym
    if !(controller_permissions.keys & roles).empty?
      actions = []
      (controller_permissions.keys & roles).each { |x| actions | controller_permissions[x] }
      head 403 if !actions.include?(action_name.to_sym)
    else
      head 403
    end
  end
end