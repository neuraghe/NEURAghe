# PULP Software Development Kit



## About

This is the entry point for the Pulp SDK, to get everything needed to compile, run and profile applications on Pulp targets. 


## Configuration

The access to the packages is restricted. They are retrieved through wget so you'll have to configure it with proper user/password. For that you can create a file called .wgetrc in your home folder and put the following lines inside:

    user=pulp
    password=SFaMjrsckj3DRjjT7rKt



## Dependencies

Once a SDK is installed, you can get the required system dependencies here: doc/<SDK version>/sdk/dependencies.html



## Installation from prebuilt packages

First get this repository:

    git clone git@iis-git.ee.ethz.ch:pulp-users/sdk.git

Then go inside the downloaded folder. There is a makefile in this repository which can be used to download a precompiled SDK. You can execute "make" to get information. The SDK should be retrieved with such a command:

	make get sdk=<sdk version>

The list of available SDK versions can be retrived with:

	make list

The makefile will guess the Linux distribution and download packages suitable for it. In case it does not match well, the distribution can be forced with:

	make list distrib=Ubuntu_14

The specified distribution must be <name>_<version> where name is either Ubuntu or CentOS and version is the major version (14 or 16 for Ubuntu or 6 for Centos).

By default, this is getting the main sdk releases. Other releases for more specific targets or needs are also done and are visible using the following option:

  make list profile=<target name>

The list of available targets can be known with this command, the one called default is the default one activated when the option is not used:

  make profiles


## Installation from sources

The procedure is quite similar to the installation using prebuilt packages but instead of executing the "get" target of the makefile, the following command must be execute:

  make src build sdk=<sdk version>

The same options can be used for example to specify the distribution as the dependencies for building the SDK from sources will also be downloaded.

Not that it is possible to first get a prebuilt package and then build, it will just overwrite the same installation folder.



## Usage

Once an SDK has been downloaded, the shell must be configured for it by sourcing the proper env file (the one displayed when the SDK is downloaded):

	source env/env-sdk-<SDK version>.sh

Or:

	source env/env-sdk-<SDK version>.csh

Then an application can be compiled and run, for example by going to pkg/sdk/<SDK version>/examples/omp/quick and executing:

	make clean all run platform=rtl pulpChip=fulmine

In order to avoid always giving the desired configuration on the command line, the following command can be launched to generate a specific configuration:

  plpconf --config=pulpChip=fulmine:platform=rtl --setup=fulmine

This should have generated setup scripts that can be sourced in order to have th shell configured for this specific configuration:

  source fulmine.sh

This means the same application as before can now be compiled and launched on the same configuration just with this command:

  make clean all run




## Documentation

The SDK documentation for all downloaded SDKs is available under the doc directory at this location: doc/<SDK version>/sdk/index.html



## Getting updates

This Git repository is updated everytime a new SDK version is available. Just stay on master branch and execute "git pull" to see new versions, then they can be seem with "make list".


## Issues

Any issue or feature request can be logged into the issue tracker of this project.
