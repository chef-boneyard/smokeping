smokeping Cookbook CHANGELOG
============================
This file is used to list changes made in each version of the smokeping cookbook.

## 3.1.0 (2017-12-05)

- Test with Local Delivery instead of Rake
- Update Apache license string in metadata
- Remove kind_of from the custom resource
- Remove the updated_by_last_action calls so we properly update the resource
- Move the templates out of the default folder
- Improve converge messages
- Switch testing to inspec
- Convert Apache 2.2 style config to Apache 2.4.
- Require Chef 12.7 not 12.5

## 3.0.0 (2017-02-16)

- Convert target LWRP to a custom resource
- Move testing to an actual testing recipe and updates chefspec testing

## 2.0.0 (2016-09-16)
- Run test kitchen tests in Travis with docker
- Add Rakefile for simplified testing and use cookstyle not rubocop
- Change ownership to Chef
- Add use_inline_resources to the LWRPs
- Expand test kitchen converage
- Require Chef 12.1 and use multipackage installs

v1.1.6
------
- Add contributing doc
- Add license file
- Expand requirements section of the readme
- Add more files to the chefignore file
- Use standard chef .gitignore file
- Add source_url and issues_url to the metadata file
- Skip Test Kitchen gem installs on travis
- Add a changelog file
- Breakout Gemfile into groups
