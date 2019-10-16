#ifndef __CLE_INTERNALS__
#define __CLE_INTERNALS__

/*
 * Internal functions, constants and variables
 *
 * Do not use these functions
 */

/*
 * Priorities for the generic task FIFO
 */
#define CLE_TASK_FIFO_NB_PRIO 2

// Task close action priority
// Note this one has the highest priority because it is better
// to first close tasks as it unblocks ready tasks for the device
// whereas other actions will handle non-ready tasks
#define CLE_TASK_CLOSE_PRIO 0
// Task parse action priority
#define CLE_TASK_PARSE_PRIO 1

extern cle_sharedFifo_t *taskEngine;

void cle_handleTaskClose(cle_task_t *task);
void cle_handleTaskFinish(cle_task_t *task);
void cle_handleTaskRelease(cle_task_t *task);

#include <stdio.h>

static inline void cle_task_enqueueCallback(cle_task_t *task, void (*callback)(cle_task_t *task), int prio) {
  task->enqueueCallback = callback;
  cle_sharedFifo_push(taskEngine, prio, &task->fifoElem);
}

#endif
