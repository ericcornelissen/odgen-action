# ODGen Action

A GitHub Action for [ODGen](https://github.com/Song-Li/ODGen), scan your
JavaScript project for command execution, code execution, prototype pollution,
internal property tampering, cross-site scripting (XSS) or path traversal
vulnerabilities.

Also check the [/all](./all) variant.

## Usage

```yml
- uses: ericcornelissen/odgen-action@v1
  with:
    # The type of vulnerabilities to scan for.
    #
    # Must be a (comma or newline separated) list of the following:
    # - os_command
    # - code_exec
    # - proto_pollution
    # - ipt
    # - xss
    # - path_traversal
    #
    # Required
    vulnerability_type: os_command, proto_pollution

    # The root of the project to analyze.
    #
    # Optional
    # Default: .
    root: src

    # The maximum duration of the analysis in seconds.
    #
    # Optional
    # Default: 300  (5 minutes)
    timeout: 600
```

## Features & Bugs

Note that this this project only offers a GitHub Action that runs ODGen for you.
If you want to report a problem with or improve the behavior of the Action, open
an issue in this repository. Else, report it to ODGen.

## License

This project, like ODGen itself, is available under the GPL-2.0 license.
