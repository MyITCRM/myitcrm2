# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    navigation.auto_highlight = true
    primary.item :home, 'Home', root_path
    if logged_in?
      if permitted_to? :show, Supplier.new
        primary.item :users, 'Users', users_path, :highlights_on => /\/users/
        primary.item :suppliers, 'Suppliers', suppliers_path, :highlights_on => /\/suppliers/
        primary.item :products, 'Products', products_path, :highlights_on => /\/products/
        if permitted_to? :edit, Setting.new
          primary.item :admin, 'Administration', admin_path, :highlights_on => /\/admin/
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

