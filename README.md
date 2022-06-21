# Upper-Hand fork of Paysafe Ruby SDK

___
link to original gem - https://github.com/paysafegroup/paysafe_sdk_ruby

## Installation
```
gem(
  'Paysafe',
  git: 'https://github.com/upper-hand/paysafe_sdk_ruby',
  branch: 'upper-hand-extensions',
  require: 'paysafe',
)
```
## For development on local path
```
gem(
  'Paysafe',
  path: 'your-local-path/paysafe_sdk_ruby',
  require: 'paysafe',
)
```
## After your changes run
`bundle update Paysafe --local --source=/your-local-path/paysafe_sdk_ruby`


## Note:
Pay attention to `your-local-path`
