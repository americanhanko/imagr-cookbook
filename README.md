# Imagr Cookbook

[Imagr](https://github.com/grahamgilbert/imagr) is a macOS imaging and workflow solution written by Graham Gilbert.

This cookbook is written to make creating and modifying the `imagr_config.plist` easier. Root Plist settings are set using attributes, workflow settings are set using the `imagr_workflow` resource, and the component settings are set using multiple `imagr_component` resources.

## Attributes

```ruby
default['imagr']['plist']['password'] = ''
default['imagr']['plist']['autorun'] = ''
default['imagr']['plist']['autorun_time'] = ''
default['imagr']['plist']['default_workflow'] = ''
default['imagr']['plist']['background_image'] = ''
default['imagr']['plist']['wait_for_network'] = ''
default['imagr']['plist']['restart_action'] = ''

default['imagr']['plist']['workflows'] = []
default['imagr']['config']['path'] = "#{ENV['HOME']}/imagr_config.plist"
```

## Example usage

### recipes/munki_10103.rb

```ruby
imagr_workflow 'Munki_10103' do
  description 'Deploys a 10.10.3 image with Munki Tools and its configuration.'
end

imagr_component 'image' do
  url 'http://192.168.178.135/osx_custom_150410-10.10.3-14D131.hfs.dmg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/MunkiTools.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/Munki_Config.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'package' do
  url 'http://192.168.178.135/clearReg.pkg'
  parent_workflow 'Munki_10103'
end

imagr_component 'script_inline' do
  content <<-EOF
  #!/bin/bash
  echo "&lt;"
  echo "{{target_volume}}"
  /usr/bin/touch "{{target_volume}}/some_file"
  EOF
  parent_workflow 'Munki_10103'
end
```

### recipes/install_os_x.rb

```ruby
imagr_workflow 'Install OS X' do
  description 'COSXIP example workflow to installs OS X on the target volume.'
  bless_target false
  first_boot_reboot false
  restart_action 'restart'
end

imagr_component 'package' do
  url 'http://192.168.178.135/COSXIP-10.11.3.dmg'
  parent_workflow 'Install OS X'
end
```
