# MyITCRM - Repairs Business CRM Software
# Copyright (C) 2009-2013  Glen Vanderhel
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class ApplicationController < ActionController::Base
#	 Ensures that all users have restrictions based on roles throughout the entire application via CanCan
#	check_authorization

  include Authentication


  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


# Used to notify user that they have tried to request a restricted action. Refer to log for more details
# mytodo - Uncomment the next 4 lines of code before going live in production mode and also once permissions are sorted out.
  rescue_from CanCan::AccessDenied do
    flash[:alert] = t "global.access_denied"
    redirect_to root_url
  end


end
