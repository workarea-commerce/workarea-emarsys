Workarea.append_partials(
  'storefront.document_head',
  'workarea/storefront/emarsys_tracking'
)

Workarea.append_partials(
  'storefront.current_user',
  'workarea/storefront/emarsys/current_user_emarsys_cart'
)

Workarea.append_partials(
  "admin.settings_menu",
  "workarea/admin/shared/emarsys_configuration_link"
)

Workarea.append_javascripts(
  'storefront.modules',
  'workarea/storefront/emarsys/modules/web_extend_adapter'
)
