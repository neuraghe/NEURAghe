#!/bin/bash
ssh ${NEURAGHE_BOARD_ADDR} "cd ${NEURAGHE_INSTALL_DIR}; echo $CI_USER_PASSWORD | sudo -S ./run-test.sh $NEURAGHE_DMA"