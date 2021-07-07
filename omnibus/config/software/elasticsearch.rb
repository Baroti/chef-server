#
# Copyright:: Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "elasticsearch"
default_version "6.8.17"

dependency "server-open-jre"

license "Apache-2.0"
license_file "LICENSE.txt"
skip_transitive_dependency_licensing true

relative_path "elasticsearch-#{version}"

version "6.8.17" do
  source url: "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-#{version}.tar.gz",
         sha512: "0f165357b1f389fbd01f07397a2b3ea5d493fae720c15213f2ee47a0c2c75bc4a448384767646d7585a18d4577899b840121c1829a987a16d2de68f216b28f7c"
end

version "7.9.3" do
  source url: "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-#{version}-linux-x86_64.tar.gz",
         sha512: "bb02a5dc1caef97638a959ebba05dd649083c856334f30c670b851067292d7230e561d8759b15a80be73537d7a7efd9cef427d253cbb2efdbd6b168c6f9baa13"
end

target_path = "#{install_dir}/embedded/elasticsearch"

build do
  mkdir  "#{target_path}"
  delete "#{project_dir}/lib/sigar/*solaris*"
  delete "#{project_dir}/lib/sigar/*sparc*"
  delete "#{project_dir}/lib/sigar/*freebsd*"
  delete "#{project_dir}/config"
  delete "#{project_dir}/jdk"
  delete "#{project_dir}/modules/x-pack-ml"
  delete "#{project_dir}/modules/ingest-geoip"
  mkdir  "#{project_dir}/plugins"
  # by default RPMs will not include empty directories in the final package
  # ES will fail to start if this dir is not present.
  touch  "#{project_dir}/plugins/.gitkeep"

  sync   "#{project_dir}/", "#{target_path}"

  # Dropping a VERSION file here allows additional software definitions
  # to read it to determine ES plugin compatibility.
  command "echo #{version} > #{target_path}/VERSION"
end
