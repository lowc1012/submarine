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


function submarine_error
{
  echo "$*" 1>&2  
}

}
function submarine_exit_with_usage
{
  local exitcode=$1
  if [[ -z $exitcode ]]; then
    exitcode=1
  fi
  # shellcheck disable=SC2034
  if declare -F submarine_usage >/dev/null ; then
    submarinie_usage
  elif [[ -x /usr/bin/cowsay ]]; then
    /usr/bin/cowsay -f elephant "Sorry, no help available."
  else
    submarine_error "Sorry, no help available."
  fi
  exit $exitcode
}

# description  Reset the usage information to blank
function hadoop_reset_usage
{
  SUBMARINE_SUBCMD_USAGE=()
  SUBMARINE_OPTION_USAGE=()
  SUBMARINE_SUBCMD_USAGE_TYPES=()
  SUBMARINE_SUBCMD_USAGE_COUNTER=0
  SUBMARINE_OPTION_USAGE_COUNTER=0
}

# description  Add a subcommand to the usage output
# param 1      subcommand
# param 2      subcommand type
# param 3      subcommand description
function submarine_add_subcommand
{
  declare subcmd=$1
  declare subtype=$2
  declare text=$3

  SUBMARINE_SUBCMD_USAGE[${SUBMARINE_SUBCMD_USAGE_COUNTER}]="${subcmd}@${subtype}@${text}"
  ((SUBMARINE_SUBCMD_USAGE_COUNTER=SUBMARINE_SUBCMD_USAGE_COUNTER+1))
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


# description  build up the submarine command's usage text.
function submarine_generate_usage
{
  echo "Usage: ${SUBMARINE_SHELL_EXECNAME} <object> [<action>] [<args>]"
  echo "  Below are all objects / actions:"




}





