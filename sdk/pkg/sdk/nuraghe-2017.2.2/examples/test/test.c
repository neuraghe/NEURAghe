#include "pulp.h"
#include "bench.h"

static void test0(testresult_t *result, void (*start)(), void (*stop)());
static void test1(testresult_t *result, void (*start)(), void (*stop)());

static testcase_t testcases[] = {
  { .name = "test0",          .test = test0          },
  { .name = "test1",          .test = test1          },
  {0, 0}
};

int main()
{
  if (get_core_id() == 0) {
    return run_suite(testcases);
  }

  return 0;
}

static void test0(testresult_t *result, void (*start)(), void (*stop)()) {
  volatile int i;
  start();
  for (i=0; i<1000; i++);
  stop();
  result->errors++;
}

static void test1(testresult_t *result, void (*start)(), void (*stop)()) {
  volatile int i;
  start();
  for (i=0; i<100; i++);
  stop();
  result->errors += 10;
}
