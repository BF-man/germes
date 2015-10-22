ActiveAdmin.register User do
  permit_params :name, :task, :email, :role, :encrypted_password, :reset_password_token

  index do
    column :id
    column :email
    column :name
    column :role
    column :task
    column :reset_password_token
    column :reset_password_sent_at

    ## Rememberable
    column :remember_created_at

    ## Trackable
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip

    actions
  end

  form do |f|
    f.inputs t(:user_details) do
      f.input :email
      f.input :name
      li do
        f.label :role
        f.select(:role, User.roles.keys.map {|role| [role.titleize,role]})
      end
      f.input :task
    end
    f.button :Submit
  end
end
