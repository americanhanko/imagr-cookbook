default['imagr']['plist']['password'] = ''
default['imagr']['plist']['autorun'] = ''
default['imagr']['plist']['autorun_time'] = ''
default['imagr']['plist']['default_workflow'] = ''
default['imagr']['plist']['background_image'] = ''
default['imagr']['plist']['wait_for_network'] = ''
default['imagr']['plist']['restart_action'] = ''
default['imagr']['plist']['workflows'] = []
default['imagr']['config']['plist'] = 'imagr_config.plist'

default['imagr']['url'] = ''
default['imagr']['app']['plist'] = '/Library/Preferences/com.grahamgilbert.Imagr.plist'
default['imagr']['app']['version'] = '1.4.1'
default['imagr']['app']['source'] = "https://github.com/grahamgilbert/imagr/releases/download/#{node['imagr']['app']['version']}/Imagr-#{node['imagr']['app']['version']}.dmg"
