# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    navigation.auto_highlight = true
    primary.item :home, 'Home', root_path
    if logged_in?
      if permitted_to? :show, Supplier.new
        if permitted_to? :edit, Setting.new
          primary.item :admin, 'Administration', admin_path
          primary.item :users, 'Users', users_path
          primary.item :suppliers, 'Suppliers', suppliers_path
          primary.item :products, 'Products', products_path
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

