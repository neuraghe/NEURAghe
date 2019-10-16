#!/usr/bin/env python

import os
import tarfile
import os.path
import argparse


src="cc4d57cddb7d3fe70a774e1ee6c20a61ac7e7fa2"
artefacts=[["https://iis-artifactory.ee.ethz.ch/artifactory/release/Ubuntu_16/pulp/sdk/mainstream/7162aee833d5713ac0f96eebeb7ae0dee1b2fa77/0/sdk.tar.bz2", "pkg/sdk/2016.12.5"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/Ubuntu_16/pulp/or1k_gcc/mainstream/1.2.7/0/or1k_gcc.tar.bz2", "pkg/or1k_gcc/1.2.7"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/Ubuntu_16/pulp/or10nv2_gcc/mainstream/2.0.12/0/or10nv2_gcc.tar.bz2", "pkg/or10nv2_gcc/2.0.12"], ["https://iis-artifactory.ee.ethz.ch/artifactory/release/Ubuntu_16/pulp/riscv_gcc/mainstream/2.3.2/0/riscv_gcc.tar.bz2", "pkg/riscv_gcc/2.3.2"]]
envFileStrCsh=["setenv OR1K_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/or1k_gcc/1.2.7", "setenv OR10NV2_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/or10nv2_gcc/2.0.12", "setenv RISCV_GCC_VERSION 2.3.2", "setenv RISCV_GCC_TOOLCHAIN @PULP_PKG_HOME@/pkg/riscv_gcc/2.3.2", "setenv PULP_SDK_HOME @PULP_PKG_HOME@/pkg/sdk/2016.12.5", "if ( -e @PULP_PKG_HOME@/pkg/sdk/2016.12.5/setup.csh ) source @PULP_PKG_HOME@/pkg/sdk/2016.12.5/setup.csh", ""]
envFileStr=["export OR1K_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/or1k_gcc/1.2.7", "export OR10NV2_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/or10nv2_gcc/2.0.12", "export RISCV_GCC_VERSION=2.3.2", "export RISCV_GCC_TOOLCHAIN=@PULP_PKG_HOME@/pkg/riscv_gcc/2.3.2", "export PULP_SDK_HOME=@PULP_PKG_HOME@/pkg/sdk/2016.12.5", "if [ -e @PULP_PKG_HOME@/pkg/sdk/2016.12.5/setup.sh ]; then . @PULP_PKG_HOME@/pkg/sdk/2016.12.5/setup.sh; fi", ""]
pkg=["sdk", "2016.12.5"]

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

                if os.system('wget %s' % (artefact)) != 0:
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

        with open('env/env-%s-%s.sh' % (pkg[0], pkg[1]), 'w') as envFile:
            for env in envFileStr:
                envFile.write('%s\n' % (env.replace('@PULP_PKG_HOME@', os.getcwd())))

        with open('env/env-%s-%s.csh' % (pkg[0], pkg[1]), 'w') as envFile:
            for env in envFileStrCsh:
                envFile.write('%s\n' % (env.replace('@PULP_PKG_HOME@', os.getcwd())))

    if command == 'src':

        if os.path.exists('.git'):
            os.system('git checkout %s' % (src))
        else:
            os.system('git init .')
            os.system('git remote add -t \* -f origin git@kesch.ee.ethz.ch:pulp-sw/pulp_pipeline.git')
            os.system('git checkout %s' % (src))
