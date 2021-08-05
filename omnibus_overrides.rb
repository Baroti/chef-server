#
# When updating this, check doc/FrequentTasks.md for checklists to ensure all
# the various usages are updated in lockstep
#
override :erlang, version: "22.2"
override :'omnibus-ctl', version: "master"
override :chef, version: "v16.13.16"
override :ohai, version: "v16.13.0"
override :ruby, version: "2.7.4"
override :perl, version: "5.18.1"
override :nokogiri, version: "1.10.10" # if not pinned it forces the entire stack to rebuild

override :cpanminus, version: "1.7004" # 1.9019 breaks installs currently
override :logrotate, version: "3.9.2" # 3.18.0 patches fail

override :openresty, version: "1.19.3.2"
