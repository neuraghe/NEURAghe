import os.path

def execCmd(cmd):
    print ('Executing command: ' + cmd)
    return os.system(cmd)

def getSectionBinaries(binary, dirPath, pulpCoreArchi):
    binFile = '%s.l2.bin' % (os.path.join(dirPath, os.path.basename(binary)))
    binFileTcdm = '%s.tcdm.bin' % (os.path.join(dirPath, os.path.basename(binary)))
    return [binFile, binFileTcdm]

def genSectionBinaries(binary, dirPath, pulpCoreArchi):
    binFile, binFileTcdm = getSectionBinaries(binary, dirPath, pulpCoreArchi)
    if pulpCoreArchi.find('riscv') != -1 or pulpCoreArchi.find('ri5cy') != -1:
        objcopy = 'riscv32-unknown-elf-objcopy'
    else:
        objcopy = 'or1kle-elf-objcopy'
    if execCmd("%s -j .heapsram -O binary %s %s" % (objcopy, binary, binFileTcdm)): return []
    if execCmd("%s -j .vectors -j .text -j .data -j .ram -j .dtors -j .rodata -j .got -j .boot -O binary %s %s" % (objcopy, binary, binFile)): return []
    return 0