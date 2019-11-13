Workarea::Configuration.define_fields do
  fieldset 'Emarsys', namespaced: false do
    field 'Customer ID',
      type: :string,
      default: '',
      description: 'Emarsys customer ID. Required for using API endpoints. Contact your Emarays Support team to get this value.',
      allow_blank: true

    field 'Merchant ID',
      type: :string,
      default: '',
      description: 'Your Emarsys merchant ID. This value is required for the Web Extend data integration.',
      allow_blank: true

    field 'Emarsys Production API',
      id: :emarsys_production,
      type: :boolean,
      default: false,
      description: 'Whether to use the production API endpoints.'
  end
end
