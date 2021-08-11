require "chef-utils/dist"

add_command_under_category "check-config", "general", "Load the #{ChefUtils::Dist::Server::SERVER} configuration and run all preflight checks", 1 do
  chef_args = "-l fatal"
  attributes_path = "#{base_path}/embedded/cookbooks/check-config.json"
  status = run_chef(attributes_path, chef_args)
  exit!(status.success? ? 0 : 1)
end
