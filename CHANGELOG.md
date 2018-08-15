# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Calendar Versioning](https://calver.org/) (YYYY.0M.0D.MICRO).

## 15.08.18-1 - 2018-08-15
### Added
- Added variable (`cluster`) to allow to create three Avi Controller instaces instead of only single Avi Controller instances
- Added variable (`ami_id`) to specifiy a certain ami_id. If not specified the latest version available in the AWS marketplace will be used.
- Added a provision which checks if the controller is booted. This forces the terraform  to wait until the Avi Controller API is available.
- Specified new depedencies: `curl` and `jq`

### Changed
- Update readme for better unterstanding of inputs and outputs


## [05.08.18-1] - 2018-04-17
### Changed
- Updated security group configuration to allow NTP (UDP 123) and SNMP (UDP 161) traffic to reach the Avi Controller

## [18.04.18-1] - 2018-04-17
### Added
- This changelog

### Changed
- Avi Controller instance now uses gp2 SSD instead of slow standard magnetic disk
- File name from hosts.tf to instance.tf for better readabilty
- SSH auth key is now expected as plain text and not a file. 
- key_path variable changed to public_key