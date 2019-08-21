module Workarea
  module Admin
    module Emarsys
      class ConfigurationsController < Admin::ApplicationController
        required_permissions :settings

        def edit
          @configuration = configuration
        end

        def update
          if configuration.update_attributes(configuration_params)
            redirect_to admin.edit_emarsys_configuration_path, flash: { success: t('workarea.admin.emarsys_configuration.edit.flash_messages.updated') }
          else
            flash[:error] = t('workarea.admin.emarsys_configuration.edit.flash_messages.save_error')
            @configuration = configuration
            render :edit, status: :unprocessable_entity
          end
        end

        private
          def configuration
            model = Workarea::Emarsys::Configuration.current
            Workarea::Admin::EmarsysConfigurationViewModel.new(model)
          end

          def configuration_params
            params.permit(:production, :merchant_id, :customer_id)
          end
      end
    end
  end
end
