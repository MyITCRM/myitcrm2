# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    navigation.auto_highlight = true
    primary.item :home, 'Home', root_path do |sub_nav|
      sub_nav.item :logout, 'Logout', logout_path, :if => Proc.new { logged_in? }
    end
    if logged_in?
        primary.item :work_orders, 'Work Orders', work_orders_path, :highlights_on => /\/work_orders/  do |sub_nav|
          sub_nav.item :work_orders, 'New Work Order', new_work_order_path
          end
       primary.item :users, [t "naviagtion.users"], users_path  do |sub_nav|
         sub_nav.item :users, 'New User', new_user_path
       end
    if can? :manage, User
          primary.item :suppliers, 'Suppliers', suppliers_path, :highlights_on => /\/suppliers/ do |sub_nav|
            sub_nav.item :suppliers, [t 'global.create'], new_supplier_path
          end
          primary.item :products, 'Products', products_path  do |sub_nav|
            sub_nav.item :products, [t 'global.create'], new_product_path
          end
          primary.item :settings, 'Settings', settings_path, :highlights_on => /\/settings/
    end
       # primary.item :profile, 'My Details', my_account_url(:id => current_user)
        primary.item :logout, 'Logout', logout_path
    else
      primary.item :register, 'Register', register_path, :highlights_on => /\/register/
      primary.item :login, 'Login', login_path, :highlights_on => /\/login/
    end
  end
  end

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
#  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
#    primary.item :key_1, 'name', url, options

    # Add an item which has a sub navigation (same params, but with block)
#    primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
#      sub_nav.item :key_2_1, 'name', url, options
#    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
#    primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
#    primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

#  end

#end
