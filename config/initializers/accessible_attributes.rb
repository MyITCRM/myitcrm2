class  ActiveRecord::Base

  attr_accessible
  attr_accessor :dynamic_attributes

  private

  def mass_assignment_authorizer(role = :default)
      if dynamic_attributes == :all
        self.class.protected_attributes
      else
        super + (dynamic_attributes || [])
      end
  end
  end