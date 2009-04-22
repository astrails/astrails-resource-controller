module ResourceController::Helpers::CurrentObjects
  def per_page
    [params[:per_page] || 20, 100].min
  end

  def page
    params[:page]
  end

  def collection
    end_of_association_chain.paginate(:page => page, :per_page => per_page)
  end
end
