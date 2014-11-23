ActiveAdmin.register Plan do
  permit_params :address, :description, :latitude, :longitude

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  collection_action :import_csv, :method => :post do
    plan_import = PlanImporter.new(:url => params[:url])
    plan_import.download
    plan_import.import

    redirect_to({:action => :index}, {:notice => "CSV imported successfully!"})
  end

end
