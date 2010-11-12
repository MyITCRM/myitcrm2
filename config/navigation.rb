# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    navigation.auto_highlight = true
    primary.item :home, 'Home', root_path
    if logged_in?
      if permitted_to? :show, Supplier.new
        primary.item :users, [t "naviagtion.users"], users_path, :highlights_on => /\/users/
        primary.item :work_orders, 'Work Orders', work_orders_path, :highlights_on => /\/work_orders/
        primary.item :suppliers, 'Suppliers', suppliers_path, :highlights_on => /\/suppliers/
        primary.item :products, 'Products', products_path, :highlights_on => /\/products/
        if permitted_to? :edit, Setting.new
          primary.item :settings, 'Settings', settings_path, :highlights_on => /\/settings/
        end
      end
      if permitted_to? :edit_profile, User.new
        primary.item :profile, 'My Details', profile_url(:id => current_user)
      end

      primary.item :logout, 'Logout', logout_path
    else
      primary.item :home, 'Register', signup_path
      primary.item :home, 'Login', login_path
    end
  end

end

