# Chef Template
This is the template used for future chef recipes for use within Markup. 

## How to use
Checkout and remove the .git

`git clone git@github.com:usemarkup/chef-template.git your-project-name && rm -Rf your-project-nam/.git/`

Once you have the files you need to install the gems in order to use the cookbook, `bundle install` will 
install all the gems within the gemfile. Once you have done this you can build the cookbook.

```
# This will create a new virtualmachine run the chef & tests than remove the virtualmachine
kitchen test

# Builds the virtualmachine but keeps it, you can repeatably call this when creating the cookbook
kitchen converge

# Runs the tests against the built machine
kitchen verify

# Destroys the machine
kitchen destroy
```

Cookbook requirements;

* Use **chef 12.6.0** (Chef 13 should be considered though)
* **CentOS 6.7** and future support for CentOS 7 ideally.
* Kitchen CI tests!

## Attributes
You should try to think forward about what is a useful attribute, 

**You should**
__(also you can not use dashes)__

```
default[:cookbook_name][:attribute] = "value"
```

**You should not**

```
default["cookbook_name"]["attribute"] = "value"
```

## Tests
Kitchen CI is what we are currently using, documentation can be found here http://kitchen.ci/docs/getting-started/writing-test
