/*
 * Copyright (c) 2013 Germain Haugou
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#ifndef __PTHREAD_H__
#define __PTHREAD_H__

#define PTHREAD_MUTEX_INITIALIZER {}
#define PTHREAD_COND_INITIALIZER {}

typedef struct thread_s thread_t;
typedef thread_t *pthread_t;
typedef struct threadQueue_s threadQueue_t;

#define PTHREAD_JBLEN (14*4)

struct thread_s {
  unsigned char jmpbuf[PTHREAD_JBLEN];
  thread_t *next;
};

struct threadQueue_s {
  thread_t *first;
  thread_t *last;
};

typedef struct {
  int locked;
  threadQueue_t waiting;
} pthread_mutex_t;

typedef struct {
  int signaled;
  threadQueue_t waiting;
} pthread_cond_t;

typedef struct {
} pthread_mutexattr_t;

typedef struct {
} pthread_condattr_t;

typedef struct {
} pthread_attr_t;

int pthread_mutex_init(pthread_mutex_t *mutex, const pthread_mutexattr_t *mutexattr);

int pthread_mutex_lock(pthread_mutex_t *mutex);

int pthread_mutex_unlock(pthread_mutex_t *mutex);

int pthread_mutex_destroy(pthread_mutex_t *mutex);

int pthread_cond_init(pthread_cond_t *cond, pthread_condattr_t *cond_attr);

int pthread_cond_signal(pthread_cond_t *cond);

int pthread_cond_broadcast(pthread_cond_t *cond);

int pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex);

int pthread_cond_destroy(pthread_cond_t *cond);

int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
		   void *(*start_routine) (void *), void *arg);

int pthread_join(pthread_t thread, void **retval);

int pthread_cond_irq_broadcast(pthread_cond_t *cond);
int pthread_cond_irq_signal(pthread_cond_t *cond);

#endif
