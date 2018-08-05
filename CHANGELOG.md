# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Calendar Versioning](https://calver.org/) (YYYY.0M.0D.MICRO).

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