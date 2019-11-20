#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# we need to declare this globally as an array, which can only
# be done outside of a function
declare -a SUBMARINE_SUBCMD_USAGE
declare -a SUBMARINE_OPTION_USAGE
declare -a SUBMARINE_SUBCMD_USAGE_TYPES


# description  Add a subcommand to the usage output
# param 1      subcommand
# param 2      subcommand type
# param 3      subcommand description
function submarine_add_subcommand
{
  declare subcmd=$1
  declare subtype=$2
  declare text=$3

  $SUBMARINE_SUBCMD_USAGE[${}]

}


# description  Add an option to the usage output
# param 1      subcommand
# param 2      subcommand description
function submarine_add_option
{
  local option=$1
  local text=$2

  SUBMARINE_OPTION_USAGE[${SUBMARINE_OPTION_USAGE_COUNTER}]="${option}@${text}"
  ((SUBMARINE_OPTION_USAGE_COUNTER=SUBMARINE_OPTION_USAGE_COUNTER+1))
}






