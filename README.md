FinFork - Financial Forecasting
================================

FinFork is a Yii 2  Application based on the initial basic skeleton supplied with the new Yii version.

The application will be able to read bank export files (.csv) and assign transactions to categories.
Additionally (and most importantly) FinFork will create forecasts for fixed costs (recuring) and gives
the ability to add planed/ anticipated transactions before they happen. When a transaction is imported that fits
a forecasted one it will try to merge the two and update.


DIRECTORY STRUCTURE
-------------------

      assets/             contains assets definition
      commands/           contains console commands (controllers)
      config/             contains application configurations
      controllers/        contains Web controller classes
      mail/               contains view files for e-mails
      models/             contains model classes
      resources/          contains project specific resources such as logo and sql files
      runtime/            contains files generated during runtime
      tests/              contains various tests for the basic application
      vendor/             contains dependent 3rd-party packages
      views/              contains view files for the Web application
      web/                contains the entry script and Web resources


REQUIREMENTS
------------

The minimum requirement by this application is PHP 5.4.0 and MySQL.

