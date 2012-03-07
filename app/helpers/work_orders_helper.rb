module WorkOrdersHelper
  def invoice(work_order_id = nil)
   Invoice.where("work_order_id = ?", "#{work_order_id}")
  end

  def replies
    @replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 10, :page => params[:page])
  end

  def reply
    @reply = Reply.new
  end

    #@invoiced = Invoice.find_all_by_work_order_id(params[:id]).first

    #@replies = Reply.where("work_order_id = ?","#{params[:id]}").order("id DESC").paginate(:per_page => 4, :page => params[:page])


end
