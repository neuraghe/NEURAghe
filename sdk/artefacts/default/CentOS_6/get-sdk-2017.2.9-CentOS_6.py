#!/usr/bin/env python

import os
import tarfile
import os.path
import argparse


src="08b13f8b905a29cdbf1d563593a3a00d413ce480"
artefacts=[["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/sdk/mainstream/5865f94aeece9d2be939e8a805f0bb221c40e2f9/0/sdk.tar.bz2", "pkg/sdk/dev"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/or1k_gcc/mainstream/1.2.7/0/or1k_gcc.tar.bz2", "pkg/or1k_gcc/1.2.7"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/or10nv2_gcc/mainstream/2.0.12/0/or10nv2_gcc.tar.bz2", "pkg/or10nv2_gcc/2.0.12"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/riscv_gcc/mainstream/2.3.2/0/riscv_gcc.tar.bz2", "pkg/riscv_gcc/2.3.2"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/riscvv2_gcc/mainstream/2.3.7/0/riscvv2_gcc.tar.bz2", "pkg/riscvv2_gcc/2.3.7"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/CentOS_6/pulp/riscvslim_gcc/mainstream/2.3.6/0/riscvslim_gcc.tar.bz2", "pkg/riscvslim_gcc/2.3.6"]]
envFileStrCsh=["alias prepend_path 'set arg2=\"\!:2\";  if ($?\!:1 == 0) setenv \!:1 \"$arg2\";  if ($?\!:1 && $\!:1 !~ {,*:}\"$arg2\"{:*,}) setenv \!:1 \"$arg2\":\"$\!:1\";'", "", "if ( $?LD_LIBRARY_PATH ) then", "setenv LD_LIBRARY_PATH /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64:$LD_LIBRARY_PATH", "else", "prepend_path LD_LIBRARY_PATH /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64", "endif", "prepend_path PATH /usr/pack/kcachegrind-0.7.4-gh/bin:$PATH", "setenv PULP_PKG_PATH @PULP_PKG_HOME@/pkg", "setenv PULP_OR1K_GCC_VERSION 1.2.7", "setenv OR1K_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/or1k_gcc/1.2.7", "setenv PULP_OR10NV2_GCC_VERSION 2.0.12", "setenv OR10NV2_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/or10nv2_gcc/2.0.12", "setenv PULP_RISCV_GCC_VERSION 2.3.2", "setenv RISCV_GCC_VERSION 2.3.2", "setenv RISCV_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/riscv_gcc/2.3.2", "setenv PULP_RISCVV2_GCC_VERSION 2.3.7", "setenv RISCVV2_GCC_VERSION 2.3.7", "setenv RISCVV2_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/riscvv2_gcc/2.3.7", "setenv PULP_RISCVSLIM_GCC_VERSION 2.3.6", "setenv RISCVSLIM_GCC_VERSION 2.3.6", "setenv RISCVSLIM_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/riscvslim_gcc/2.3.6", "setenv PULP_SDK_VERSION dev", "setenv PULP_SDK_HOME @PULP_PKG_HOME@/pkg/sdk/2017.2.9", "if ( -e @PULP_PKG_HOME@/pkg/sdk/2017.2.9/setup.csh ) source @PULP_PKG_HOME@/pkg/sdk/2017.2.9/setup.csh", ""]
envFileStr=["add_path() {", "export PATH=${PATH//\":$1:\"/:}", "export PATH=${PATH/%\":$1\"/}", "export PATH=${PATH/#\"$1:\"/}", "export PATH=\"$1${PATH:+\":$PATH\"}\"", "}", "add_ld_path() {", "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH//\":$1:\"/:}", "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/%\":$1\"/}", "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH/#\"$1:\"/}", " export LD_LIBRARY_PATH=\"$1${LD_LIBRARY_PATH:+\":$LD_LIBRARY_PATH\"}\"", "}", "add_ld_path /usr/pack/gcc-4.9.1-af/x86_64-rhe6-linux/lib64", "add_path /usr/pack/kcachegrind-0.7.4-gh/bin", "export PULP_PKG_PATH=@PULP_PKG_HOME@/pkg", "export PULP_OR1K_GCC_VERSION=1.2.7", "export OR1K_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/or1k_gcc/1.2.7", "export PULP_OR10NV2_GCC_VERSION=2.0.12", "export OR10NV2_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/or10nv2_gcc/2.0.12", "export PULP_RISCV_GCC_VERSION=2.3.2", "export RISCV_GCC_VERSION=2.3.2", "export RISCV_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/riscv_gcc/2.3.2", "export PULP_RISCVV2_GCC_VERSION=2.3.7", "export RISCVV2_GCC_VERSION=2.3.7", "export RISCVV2_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/riscvv2_gcc/2.3.7", "export PULP_RISCVSLIM_GCC_VERSION=2.3.6", "export RISCVSLIM_GCC_VERSION=2.3.6", "export RISCVSLIM_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/riscvslim_gcc/2.3.6", "export PULP_SDK_VERSION=dev", "export PULP_SDK_HOME=@PULP_PKG_HOME@/pkg/sdk/2017.2.9", "if [ -e @PULP_PKG_HOME@/pkg/sdk/2017.2.9/setup.sh ]; then . @PULP_PKG_HOME@/pkg/sdk/2017.2.9/setup.sh; fi", ""]
pkg=["sdk", "2017.2.9"]

parser = argparse.ArgumentParser(description='PULP downloader')

parser.add_argument('command', metavar='CMD', type=str, nargs='*',
                   help='a command to be execute')

parser.add_argument("--path", dest="path", default=None, help="Specify path where to install packages and sources")

args = parser.parse_args()

if len(args.command ) == 0:
    args.command = ['get']

if args.path != None:
    path = os.path.expanduser(args.path)
    if not os.path.exists(path):
        os.makedirs(path)
    os.chdir(path)

for command in args.command:

    if command == 'get' or command == 'download':

        dir = os.getcwd()

        if command == 'get':
            if not os.path.exists('pkg'): os.makedirs('pkg')

            os.chdir('pkg')

        for artefactDesc in artefacts:
            artefact = artefactDesc[0]
            path = os.path.join(dir, artefactDesc[1])
            urlList = artefact.split('/')
            fileName = urlList[len(urlList)-1]

            if command == 'download' or not os.path.exists(path):

                if os.path.exists(fileName):
                    os.remove(fileName)

                if os.system('wget --no-check-certificate %s' % (artefact)) != 0:
                    exit(-1)

                if command == 'get':
                    os.makedirs(path)
                    t = tarfile.open(os.path.basename(artefact), 'r')
                    t.extractall(path)
                    os.remove(os.path.basename(artefact))

        os.chdir(dir)

    if command == 'get' or command == 'download' or command == 'env':

        if not os.path.exists('env'):
            os.makedirs('env')

        filePath = 'env/env-%s-%s.sh' % (pkg[0], pkg[1])
        with open(filePath, 'w') as envFile:
            envFile.write('export PULP_ENV_FILE_PATH=%s\n' % os.path.join(os.getcwd(), filePath))
            for env in envFileStr:
                envFile.write('%s\n' % (env.replace('@PULP_PKG_HOME@', os.getcwd())))

        filePath = 'env/env-%s-%s.csh' % (pkg[0], pkg[1])
        with open(filePath, 'w') as envFile:
            envFile.write('setenv PULP_ENV_FILE_PATH %s\n' % os.path.join(os.getcwd(), filePath))
            for env in envFileStrCsh:
                envFile.write('%s\n' % (env.replace('@PULP_PKG_HOME@', os.getcwd())))

    if command == 'src':

        if os.path.exists('.git'):
            os.system('git checkout %s' % (src))
        else:
            os.system('git init .')
            os.system('git remote add -t \* -f origin git@kesch.ee.ethz.ch:pulp-sw/pulp_pipeline.git')
            os.system('git checkout %s' % (src))
