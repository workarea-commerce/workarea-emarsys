Workarea Emarsys
================================================================================

Emarsys plugin for the Workarea platform.

This integration supports the following:

1. Contact syncronization
2. Product files
3. Order syncronization
4. Full Web-Extend Analytics integration

Getting Started
--------------------------------------------------------------------------------

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-emarsys'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

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

Workarea Commerce Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

License
--------------------------------------------------------------------------------

Workarea Emarsys is released under the [Business Software License](LICENSE)
