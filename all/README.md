# ODGen Action - All vulnerability types

A GitHub Action to scan your project for all vulnerability types supported by
[ODGen](https://github.com/Song-Li/ODGen).

## Usage

```yml
- uses: ericcornelissen/odgen-action/all@v1
  with:
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
