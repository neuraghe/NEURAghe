#ifndef __RT_DEV_H__
#define __RT_DEV_H__

// The offset of the request index in the request identifier
#define RT_REQ_ID_OFFSET 16
// The offset of the programming model index in the full request identifier
#define RT_PM_ID_OFFSET 2
// Low-level runtime requests programming model identifier
#define RT_REQ_PM_ID 0

typedef struct {
  int type; // Used by communication layer to know which callback must be called when the message is received
} rt_req_t;

static inline void rt_req_init(rt_req_t *req, unsigned int reqId) {
  req->type = reqId;
}

static inline unsigned int rt_req_get_id(unsigned int index, unsigned int pmId) {
  return (index << RT_REQ_ID_OFFSET) | (pmId << RT_PM_ID_OFFSET);
}

#endif
