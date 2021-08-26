# The Fuck settings file
"""
    rules – list of enabled rules, by default thefuck.const.DEFAULT_RULES;
    exclude_rules – list of disabled rules, by default [];
    require_confirmation – requires confirmation before running new command, by default True;
    wait_command – the max amount of time in seconds for getting previous command output;
    no_colors – disable colored output;
    priority – dict with rules priorities, rule with lower priority will be matched first;
    debug – enables debug output, by default False;
    history_limit – the numeric value of how many history commands will be scanned, like 2000;
    alter_history – push fixed command to history, by default True;
    wait_slow_command – max amount of time in seconds for getting previous command output if it in slow_commands list;
    slow_commands – list of slow commands;
    num_close_matches – the maximum number of close matches to suggest, by default 3.
    excluded_search_path_prefixes – path prefixes to ignore when searching for commands, by default [].
"""

# The default values are as follows. Uncomment and change to fit your needs.
# See https://github.com/nvbn/thefuck#settings for more information.
#
# rules = [<const: All rules enabled>]
# exclude_rules = []
# wait_command = 3
# require_confirmation = True
# no_colors = False
# debug = False
# priority = {}
# history_limit = None
# alter_history = True
# wait_slow_command = 15
# slow_commands = ['lein', 'react-native', 'gradle', './gradlew', 'vagrant']
# repeat = False
# instant_mode = False
# num_close_matches = 3
# env = {'LC_ALL': 'C', 'LANG': 'C', 'GIT_TRACE': '1'}


# rules = ["cd_parent", "git_push", "python_command", "sudo", "no_command"]
