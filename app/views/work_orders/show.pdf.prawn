 pdf.image "/public/images/logo.png", :at => [10, 720], :height => 40
 pdf.move_down(70)
 pdf.text "#{t "global.workorder"} # #{@work_order.id}"
 pdf.text "Client : #{@work_order.user.name}"
 pdf.move_down(10)
 pdf.bounding_box([450,720], :width => 400, :align => :right ) do
pdf.text t "setting_details", :size => 10
pdf.text Setting::business_name, :size => 8
pdf.text Setting::business_address, :size => 8
pdf.text Setting::business_phone, :size => 8
pdf.text Setting::business_email, :size => 8
  if Setting::business_email ||= nil
   pdf.text Setting::business_email, :size => 8
  end
 end

