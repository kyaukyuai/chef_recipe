#
# Author:: Joshua Timberman <joshua@opscode.com>
# Copyright:: Copyright (c) 2013 Opscode, Inc.
# License:: Apache License, Version 2.0
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

Ohai.plugin(:Kernel) do
  provides "kernel", "kernel/modules"

  collect_data(:aix) do
    kernel Mash.new

    kernel[:name] = shell_out("uname -s").stdout.split($/)[0].downcase
    kernel[:release] = shell_out("uname -r").stdout.split($/)[0]
    kernel[:version] = shell_out("uname -v").stdout.split($/)[0]
    kernel[:machine] = shell_out("uname -p").stdout.split($/)[0]
    kernel[:modules] = Mash.new
  end
end