Workarea Emarsys
================================================================================

Emarsys plugin for the Workarea platform.

This integration supports the following:

1. Contact syncronization
2. Product files
3. Order syncronization
4. Full Web-Extend Analytics integration

Configuration
--------------------------------------------------------------------------------
An administration panel in the Worakrea Admin has been provided to set some configuration values. Users must have permissions to **settings** to access this feature.

The follow is accessible via the configuration panel:

1. **Production:** A toggle switch to set the integration into production mode, defaults to false.
2. **Customer ID:** The customer ID of account. Ask your Emarsys account manager for this value.
3. **Merchant ID:** The merchant ID of the Emarsys account. This value is required for the Web Extend Analytics Integration


The contact and sales data APIs require different access keys that require storage in the secrets file.

Add the following to your secrets:

    emarsys:
      secret_key: YOUR_SECRET_KEY_HERE
    emarsys_sales:
      api_token: YOUR_TOKEN_HERE


Data Exporting
--------------------------------------------------------------------------------
**Product Data**

Emarsys supports the google product feed specification for product catalog. This integration includes the Workarea Google Product feed to support exporting products. The Google product feed will generate at 5:00 AM daily.

You can access the Google product feed at: https://www.your_domain.com/google_feed

**Order Files**

Order files are exported every six hours. The default order fields are supported.

More information about order files can be found here: https://help.emarsys.com/hc/en-us/articles/360003070654-Preparing-your-sales-data-file

Getting Started
--------------------------------------------------------------------------------

This gem contains a rails engine that must be mounted onto a host Rails application.

To access Workarea gems and source code, you must be an employee of WebLinc or a licensed retailer or partner.

Workarea gems are hosted privately at https://gems.weblinc.com/.
You must have individual or team credentials to install gems from this server. Add your gems server credentials to Bundler:

    bundle config gems.weblinc.com my_username:my_password

Or set the appropriate environment variable in a shell startup file:

    export BUNDLE_GEMS__WEBLINC__COM='my_username:my_password'

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-emarsys', source: 'https://gems.weblinc.com'
    # ...

Or use a source block:

    # ...
    source 'https://gems.weblinc.com' do
      gem 'workarea-emarsys'
    end
    # ...

Update your application's bundle.

    cd path/to/application
    bundle

Workarea Platform Documentation
--------------------------------------------------------------------------------

See [http://developer.weblinc.com](http://developer.weblinc.com) for Workarea platform documentation.

Copyright & Licensing
--------------------------------------------------------------------------------

Copyright WebLinc 2019. All rights reserved.

For licensing, contact sales@workarea.com.
