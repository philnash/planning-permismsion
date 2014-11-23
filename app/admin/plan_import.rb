ActiveAdmin.register_page "Plan import" do
  content do
    form_for :plan_import, :url => '/admin/plans/import_csv' do
      panel '' do
        label 'URL to planning applications CSV' do
          input type: 'text', name: 'url', id: 'url'
        end
      end
      button "Submit"
    end
  end
end
