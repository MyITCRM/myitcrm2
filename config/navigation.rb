# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    navigation.auto_highlight = true
    primary.item :home, 'Home', root_path
    if logged_in?
        primary.item :work_orders, 'Work Orders', work_orders_path, :highlights_on => /\/work_orders/
        primary.item :users, [t "naviagtion.users"], users_path, :highlights_on => /\/users/
        if can? :manage, User
          primary.item :suppliers, 'Suppliers', suppliers_path, :highlights_on => /\/suppliers/
          primary.item :products, 'Products', products_path, :highlights_on => /\/products/
          primary.item :settings, 'Settings', settings_path, :highlights_on => /\/settings/
        end
        primary.item :profile, 'My Details', my_account_url(:id => current_user)
        primary.item :logout, 'Logout', logout_path
    else
      primary.item :home, 'Register', register_path, :highlights_on => /\/register/
      primary.item :home, 'Login', login_path, :highlights_on => /\/login/
    end
  end

end

