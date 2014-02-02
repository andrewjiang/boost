ActiveAdmin.register PhoneScreenStage do

  menu false

  controller do
    def permitted_params
      params.permit!
    end
  end

  show do |stage|
    attributes_table do
      row :notes
      row :fit_score
      row 'Pass?' do
        stage.pass
      end
      row :reason_if_fail
      row :clean_driving_record
      row :commitments
      row :max_availability
      row :num_partners
      row :reservation_fee
      row 'Payment Type: options are "credit card", "debit card", "paypal"' do
          stage.payment_type
        end
      row :scheduling_email
    end
  end

  form do |f|
    f.inputs do
      f.input :notes
      f.input :fit_score
      f.input :pass, :label => 'Pass?'
      f.input :reason_if_fail
      f.input :clean_driving_record
      f.input :commitments
      f.input :max_availability
      f.input :num_partners
      f.input :reservation_fee
      f.input :payment_type, :as => :select, :collection =>  ["Credit card", "Debit card", "Paypal"]
      f.input :scheduling_email
      f.actions
    end
  end
end
