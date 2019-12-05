class InformationCell < Cell::ViewModel
  def recent_informations
    @informations = Information.order(created_at: :desc).limit(5)
    render
  end
end
