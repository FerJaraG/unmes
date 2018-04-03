ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Users by week" do
          table do
             User.all.group_by(&:week).sort.each do |week, user_group|
              tr
                  td "#{Time.now - week.to_i.weeks}"
                  td "#{user_group.count}"
            end
          end
        end
      end

      column do
        panel "Users by month" do
          table do
             User.all.group_by(&:month).sort.each do |month, user_group|
              tr
                  td "#{Time.now - month.to_i.months}"
                  td "#{user_group.count}"
            end
          end
        end
      end  
    end

    columns do
      column do
        panel "Workshops consumed by month" do
          table do
             Consume.all.group_by(&:month).sort.each do |month, w_group|
              tr
                  td "#{Time.now - month.to_i.months}"
                  td "#{w_group.count}"
            end
          end
        end
      end

    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
