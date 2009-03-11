class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  
  uses_tiny_mce(:options => {:theme => 'advanced',
                             :editor_selector => "mceEditor",
                             :browsers => %w{msie gecko},
                             :theme_advanced_toolbar_location => "top",
                             :theme_advanced_toolbar_align => "left",
                             :theme_advanced_resizing => true,
                             :theme_advanced_resize_horizontal => true,
                             :paste_auto_cleanup_on_paste => false,
                             :theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough
                               separator justifyleft justifycenter justifyright indent outdent separator bullist numlist forecolor
                               backcolor separator link unlink image undo redo separator search replace separator code},
                             :theme_advanced_buttons2 => [],
                             :theme_advanced_buttons3 => [],
                             :plugins => %w{contextmenu paste searchreplace}},
                               :only => [:new, :edit, :show, :index])

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ae67e8876cffba067ec5463cd86e8616'
  include AuthenticatedSystem
  
  before_filter :retrieve_current_user
  
  protected
  
  def retrieve_current_user
    @user = current_user
  end
  
end
