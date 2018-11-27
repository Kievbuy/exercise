module CheckPermission
  extend ActiveSupport::Concern

  included do
    before_action :check_permission
  end

  def permissions
    {
        articles: {
            reader: [:index, :show],
            writer: [:index, :show, :create, :update],
            admin: all
        },
        users: {
            admin: all
        }
    }
  end

  def check_permission
    controller_permissions = permissions[controller_name.to_sym]
    roles = current_user.roles.pluck(:name).map &:to_sym
    if !(controller_permissions.keys & roles).empty?
      actions = []
      (controller_permissions.keys & roles).each do |x|
        actions |= controller_permissions[x]
      end
      head 403 unless actions.include?(action_name.to_sym)
    else
      head 403
    end
  end

  private

  def all
    [:index, :show, :create, :update, :destroy]
  end
end