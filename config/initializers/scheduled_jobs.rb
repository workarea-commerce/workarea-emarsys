Sidekiq::Cron::Job.create(
  name: 'Workarea::Emarsys::SyncOrders',
  klass: 'Workarea::Emarsys::SyncOrders',
  cron: '0 */6 * * *',
  queue: 'low'
)
