## Prerequisites

- <http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html>
- <https://toml.io/en/v1.0.0>



## Installation

todo


## Usage

```
dotter deploy -v
dotter undeploy -v -y
```



## Templating

- <https://github.com/SuperCuber/dotter/wiki/Templating-and-Caching>
- <https://handlebarsjs.com/guide/builtin-helpers.html>
- <https://github.com/davidB/handlebars_misc_helpers>



### Builtin variables

Dotter automatically defines the built-in variable dotter, that is a mapping including the following:

- dotter.packages - a mapping between the package name and the value true of the selected packages
  - intended to be used like `{{#if dotter.packages.my_package}}`, this will evaluate to false for packages that aren't in the mapping
- dotter.files - a mapping between the source and target of each deployed file
- dotter.os - either windows or unix, use something like {{#if (eq dotter.os "unix")}}



### Helpers

Available:

- math - used like `{{math font_size "*" 2}}`
  - <https://github.com/rekka/meval-rs#supported-expressions>
- include_template - used to include the contents of another file. If the file is a template, it is also rendered.
- is_executable - used to check whether a program is able to be executed.
- Use with an if statement: {{#if (is_executable "cargo")}}
- command_success - runs the command and checks if it exited successfully.
- Use with an if statement: {{#if (command_success "test 5 = 5")}}
- command_output - runs the command and inserts the output into the template.
- Use like so: {{command_output "cargo --help"}}
- All the helpers from [handlebars_misc_helpers](https://github.com/davidB/handlebars_misc_helpers)



## TODO

- minimal vimrc
- minimal zsh
- minimal bash
- backup `$env:path`

<https://github.com/romkatv/zsh4humans>

<https://gitlab.com/bertrand-benoit/scripts-common>
