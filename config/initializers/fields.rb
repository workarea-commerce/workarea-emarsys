Workarea::Configuration.define_fields do
  fieldset 'Emarsys', namespaced: false do
    field 'Merchant ID',
      type: :string,
      default: '',
      description: 'Your Emarsys merchant ID. This value is required for the Web Extend data integration.',
      allow_blank: true

    field 'Emarsys Production API',
      id: :emarsys_production_api,
      type: :boolean,
      default: true,
      description: 'Whether to use the production API endpoints.'
  end
end
