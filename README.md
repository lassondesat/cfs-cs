# cFS: Checksum

[![GitHub release](https://img.shields.io/github/release/lassondesat/cfs-cs.svg)](https://github.com/lassondesat/cfs-cs/releases)

* [Original README](cfs-cs-app-OSS-readme.txt)

## Description

The Checksum application (CS) is a core Flight System (cFS) application that is
a plug in to the Core Flight Executive (cFE) component of the cFS.

The cFS is a platform and project independent reusable software framework and
set of reusable applications developed by NASA Goddard Space Flight Center. This
framework is used as the basis for the flight software for satellite data
systems and instruments, but can be used on other embedded systems. More
information on the cFS can be found at http://cfs.gsfc.nasa.gov

The CS application is used for for ensuring the integrity of onboard memory. CS
calculates Cyclic Redundancy Checks (CRCs) on the different memory regions and
compares the CRC values with a baseline value calculated at system start up. CS
has the ability to ensure the integrity of cFE applications, cFE tables, the cFE
core, the onboard operating system (OS), onboard EEPROM, as well as, any memory
regions ("Memory") specified by the users.

## Requirements

* [Operating System Abstraction Layer][osal] 4.1.1 or higher
* [core Flight Executive][cfe] 6.4.1 or higher

## Sources

* https://sourceforge.net/projects/cfs-cs/

[osal]: https://github.com/lassondesat/osal
[cfe]: https://github.com/lassondesat/coreflightexec
