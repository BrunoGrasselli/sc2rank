class AdminController < InheritedResources::Base
  layout 'admin'

  before_filter :authenticate_user!
end
