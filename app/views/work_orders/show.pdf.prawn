#Creates a new cell object. Generally used indirectly via Document#cell
#
#Of the available options listed below, :point, :width, and :text must be provided. If you are not using the Document#cell shortcut, the :document must also be provided.
#:point	 = Absolute [x,y] coordinate of the top-left corner of the cell.
#:text = The text to be flowed within the cell
#:text_color = The color of the text to be displayed
#:width = The width in PDF points of the cell.
#:height = The height in PDF points of the cell.
#:horizontal_padding =The horizontal padding in PDF points
#:vertical_padding = The vertical padding in PDF points
#:padding = Overrides both horizontal and vertical padding
#:align = One of :left, :right, :center
#:borders = An array of sides which should have a border. Any of :top, :left, :right, :bottom
#:border_width = The border line width. Defaults to 1.
#:border_style = One of :all, :no_top, :no_bottom, :sides, :none, :bottom_only. Defaults to :all.
#:border_color = The color of the cell border.
#:font_size = The font size for the cell text.
#:font_style = The font style for the cell text.

# Logo
pdf.image "public/images/logo.png", :at => [200, 720], :height => 40
# Business information
 pdf.bounding_box([450,720], :width => 400, :align => :right ) do
    pdf.text t "setting_details"
    pdf.text Setting::business_name, :size => 8
    pdf.text Setting::business_address, :size => 8
    pdf.text Setting::business_phone, :size => 8
    pdf.text Setting::business_email, :size => 8
    if Setting::business_email ||= nil
      pdf.text Setting::business_email, :size => 8
    end
  end
# Business information
 pdf.bounding_box([10,720], :width => 200, :align => :right ) do
    pdf.text t "workorder.pdf.t_customer_details"
    pdf.text "#{@work_order.user.name}", :size => 8
    pdf.text "#{@work_order.user.address}", :size => 8
    pdf.text "#{@work_order.user.phone}", :size => 8
    pdf.text "#{@work_order.user.mobile}", :size => 8
    pdf.text "#{@work_order.user.email}", :size => 8

  end

# Let move down the pdf 10 points before next object
 pdf.move_down(15)

# Work Order details start
pdf.text "#{t "workorder.pdf.t_workorder"} # #{@work_order.id}", :size => 20, :align => :center

info = [
        ["#{t "workorder.subject"}", "#{@work_order.subject}"],
        ["#{t "workorder.details"}", "#{@work_order.description}"],
        ["#{t "workorder.assigned_to"}","#{@work_order.priority_list.name}"]
       ]
#pdf.move_down 30

pdf.table info,
:borders => [:top, :bottom],
:font_size => 12,
:position => :center,
:column_widths => { 0 => 150, 1 => 400},
:align => { 0 => :right, 1 => :left, 2 => :right, 3 => :left}
#:row_colors => ["d2e3ed", "FFFFFF"]


# pdf.cell [10,600],
#        :width => 200,
#        :font_size => 11,
#        :border_width => 0,
#        :text  => "The rain in Spain falls mainly on the plains",
#        :padding => 3
# pdf.cell [10,600],
#        :width => 525,
#        :height => 550
##        :font_size => 11,
##        :position => :center,
##        :text  => "",
##        :padding => 3
#pdf.text "#{t "workorder.pdf.t_workorder"} # #{@work_order.id}", :size => 20, :align => :center
# pdf.move_down(1)
#
#
##invoiceinfo = [["Item Name", "#{@work_order.user.name}"], ["Item Price", "#{@work_order.user.name}"],["Item Quantity", "#{@work_order.user.name}"]]
##
##pdf.move_down 30
##
##pdf.table invoiceinfo,
##:border_style => :grid,
##:font_size => 11,
##:position => :center,
##:column_widths => { 0 => 150, 1 => 250},
##:align => { 0 => :right, 1 => :left, 2 => :right, 3 => :left},
##:row_colors => ["d2e3ed", "FFFFFF"]