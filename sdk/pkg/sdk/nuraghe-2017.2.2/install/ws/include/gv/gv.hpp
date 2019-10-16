/* 
 * Copyright (C) 2015 ETH Zurich and University of Bologna
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license.  See the LICENSE file for details.
 *
 * Authors: Germain Haugou (germain.haugou@gmail.com)
 */

#ifndef __GV_HPP_
#define __GV_HPP_

class engine;

#ifndef __SWIG__
#include <vector>
#include <functional>
#include <unordered_map>
#include <string.h>
#include <math.h>
#include <cstring>
#include <assert.h>
#include <map>
#endif

using namespace std;

namespace gv {

#ifndef __SWIG__
  
  class engine;
  class topEngine;
  class clockEngine;
  class event;
  class vcdTrace;
  class ioReq;
  class ioSlave;
  class component;
  
  class powerTable
  {
  private:
    double **values;
    int nbTemp;
    int nbVoltage;
    double *temperatures;
    double *voltages;
  public:
    powerTable(int nbTemp, int nbVoltage);
    void regPowerValue(int tempIndex, double temp, int voltageIndex, double voltage, double value);
    double getScaledValue(double temperature, double voltage);
  };

  class powerEngine
  {
  private:
    std::map<std::string, gv::powerTable *> powerTables;
  public:
    powerEngine();
    void setupPowerValue(char *name, int nbTemp, int nbVoltage);
    void regPowerValue(char *name, int tempIndex, double temp, int voltageIndex, double voltage, double value);
    powerTable *getPowerTable(char *name);
  };

  class powerTrace
  {
    double eventEnergy;
    double energy;
    powerTable *table;

  public:
    powerTrace *next;
    void setTable(gv::powerTable *table) { this->table = table;}
    powerTable *getTable() { return table; }
    powerTrace() : energy(0) {}
    void account(int nbEvents) { energy += nbEvents*eventEnergy; }
    void configure(double temperature, double voltage);
  };

  class vcdFile {
public:
  vcdFile(engine *eng,char *path);
  void addTrace(vcdTrace *vcd);
  void flushPendingVcds(int64_t time);
  void dumpVcd(vcdTrace *vcd, uint8_t *value);
  void dumpVcdString(vcdTrace *vcd, uint8_t *value, int size);
  void enqueuePendingVcd(vcdTrace *vcd);
  void enqueueVcd(vcdTrace *vcd, uint8_t *value, int64_t vcdTime);
  string parsePath(string path, bool begin);
  void dumpVcdData(vcdTrace *vcd, int64_t time, uint8_t *value, int size=0);

  topEngine *eng;
  bool headerDumped;
  int64_t lastDumpedTime;
  vcdTrace *firstTrace;
  vcdTrace *firstPendingVcd;
  int nbTraces;
  FILE *file;
};

class vcdData {
public:
  vcdData(int nbBytes);
  std::vector<uint8_t> data;
  vcdData *next;
  int64_t time;
  int hasValue;
};

class vcdTrace {
private:
  gv::component *comp;
public:
  gv::vcdData *firstData;
  gv::vcdData *lastData;
  gv::vcdData *firstFreeData;
  vcdTrace();
  gv::vcdFile *file;
  bool isActive;
  bool isString;
  char *path;
  uint32_t width;
  int nbBytes;
  int id;
  gv::vcdTrace *next;
  void dump(uint8_t *value);
  void dumpString(uint8_t *value, int size);
  void enqueue(uint8_t *value, int64_t time);
  void setComponent(gv::component *comp);
  void configure(gv::component *comp, char *path, bool isActive, gv::vcdFile *file);
};



#define gv_vcd_dump(vcd,value)						\
  do {									\
    if((vcd)->isActive)							\
      (vcd)->dump(value);						\
  } while(0)

#define gv_vcd_dump_string(vcd,value,size)            \
  do {                  \
    if((vcd)->isActive)             \
      (vcd)->dumpString((uint8_t *)value,size);           \
  } while(0)

#define gv_vcd_enqueue(vcd,value,time)					\
  do {									\
    if((vcd)->isActive)							\
      (vcd)->enqueue(value, time);						\
  } while(0)


#define gv_trace_dumpUserMsg(fmt, args...)				\
  do {									\
    getUserTrace()->dumpUserMsg(fmt, ##args);				\
  } while(0)

#define gv_trace_dumpMsg(trace, fmt, args...)				\
  do {									\
    if((trace)->isActive)							\
      (trace)->dumpMsg(fmt, ##args);				\
  } while(0)

#define gv_trace_dumpWarning(trace, fmt, args...)				\
  do {									\
    if((trace)->isActive)							\
      (trace)->dumpWarning(fmt, ##args);				\
  } while(0)

class port {
public:
  port() : next(NULL) {}
  // This field is used for connection between master and multiple slaves
  port *next;
};

#define GV_ENGINE_NB_SLICE_CYCLES 16384

#define GV_ENGINE_STOP_TIME 0
#define GV_ENGINE_STOP_END  1
#define GV_ENGINE_STOP_EXIT 2
#define GV_ENGINE_STOP_BREAK 3
#define GV_ENGINE_STOP_INT  4
#define GV_ENGINE_STOP_WARNING  5
#define GV_ENGINE_STOP_CONTINUE 6

#define GV_ENGINE_STAGE_DEFAULT 0
#define GV_ENGINE_STAGE_EVAL 10
#define GV_ENGINE_STAGE_COMMIT 20

class engine {
public:
  bool isRunning;
  bool isEnqueued;
  event *first;

  engine *prev;
  engine *next;
  
  engine();
  virtual gv::powerEngine *getPowerEngine() { return NULL;}
  virtual int64_t getTime(int64_t cycles) {return 0;}
  virtual int64_t getTime() {return 0;}
  virtual int64_t getCycles() {return 0;}
  virtual void enqueue(event *event, int64_t ticks) {}
  virtual void confTrace(string name, string path) {}
  virtual void dumpUserMsg(const char *path, const char *format, va_list ap) {}
  virtual void dumpMsg(const char *path, const char *format, va_list ap) {}
  virtual void dumpWarning(const char *path, const char *format, va_list ap) {}
  virtual void stop() {}
  virtual void stop(int reason) {}
  virtual void exit(int retval) {}
  virtual void exit() {}
  virtual void setRetval(int retval) {}
  virtual int getRetval() {return 0;}
  virtual void keepRunning() {}
  virtual void keepRunningCancel() {}
  virtual void pause() {}
  virtual void resume() {}
  virtual int64_t getNextEventTime() {return 0;}  
  virtual int64_t getPeriod() {return 1;}

private:
};

class topEngine {
public:
  int retval;
  int64_t time;
  bool isRunning;
  bool isEnqueued;
  engine *firstEngine;
  int stopReason;
  int reqStopReason;
  FILE *traceFile;
  topEngine();
  void setTraceFile(char *tracePath);
  gv::powerEngine *getPowerEngine() { return this->powerEngine;}
  void enqueueEngine(engine *engine);
  void dequeueEngine(engine *engine);
  void updateEngine(engine *engine, int64_t time);
  void enqueue(event *event, int64_t time);
  int run(int64_t stepTime);
  void setRetval(int retval) {this->retval = retval;}
  int getRetval() {return retval;}
  void stop() {
    reqStop = true;
    this->retval = 0;
  }

  int64_t getTime() {
    return time;
  }

  void stop(int reason) {
    reqStop = true;
    reqStopReason = reason;
    this->retval = 0;
  }
  void stop(int reason, int retval) {
    reqStop = true;
    reqStopReason = reason;
    this->retval = retval;
  }

  void keepRunning() {
    keepRunningCount++;
  }

  void keepRunningCancel() {
    keepRunningCount--;
  }

  void pause() {
    // For performance reason, the engine is only checking reqPause without unlocking
    // First modify the var so that the engine unlocks and then we can lock
    // TODO this does not work if multiple threads outside the engine are trying to pause at the
    // same time, one may remain stuck as the other will reset reqPause to zero
    reqPause = 1;
    pthread_mutex_lock(&mutex);
  }
  
  void resume() {
    reqPause = 0;
    pthread_cond_broadcast(&cond);
    pthread_mutex_unlock(&mutex);
  }
  void confTrace(string name, string path);
  void dumpUserMsg(const char *path, const char *format, va_list ap) {
  printf("%ld: [\033[34m%-*.*s\033[0m] ", time, maxTraceLen, maxTraceLen, path);
  if (vprintf(format, ap) < 0) {
  }
  }
  void dumpMsg(const char *path, const char *format, va_list ap) {
    fprintf(traceFile, "%ld: [\033[34m%-*.*s\033[0m] ", time, maxTraceLen, maxTraceLen, path);
    if (vfprintf(traceFile, format, ap) < 0) {
    }
  }
  void dumpWarning(const char *path, const char *format, va_list ap) {
    printf("%ld: [\033[31m%-*.*s\033[0m] ", time, maxTraceLen, maxTraceLen, path);
    if (vprintf(format, ap) < 0) {
    }
    stop(GV_ENGINE_STOP_WARNING);
  }

  int64_t getNextEventTime();

  void routine();
  int wait();

  void setupPowerValue(char *name, int nbTemp, int nbVoltage);
  void regPowerValue(char *name, int tempIndex, double temp, int voltageIndex, double voltage, double value);

  int isFinished;

private:
  int maxTraceLen;
  int runStep(int64_t stepTime);
  bool reqStop;
  int reqPause;
  int keepRunningCount;
  bool reqStep;
  int64_t reqStepValue;
  pthread_t thread;
  pthread_mutex_t mutex;
  pthread_cond_t cond;
  gv::powerEngine *powerEngine;
};

class clockEngine : public engine {
public:
  clockEngine(topEngine *topEngine);
  gv::powerEngine *getPowerEngine() { return topEngineInstance->getPowerEngine();}
  void enqueue(event *event);
  void cancel(gv::event *event);
  int64_t getTime(int64_t cycles) {return cycles*period;}
  int64_t getTime() {return getTime(cycles);}
  int64_t getCycles() {return cycles;}
  int getStage() {return stage;}
  int64_t getPeriod() {return period;}

  gv::event *popEvent();
  
  topEngine *topEngineInstance;
  void confTrace(string name, string path) {topEngineInstance->confTrace(name, path);}
  void dumpMsg(const char *path, const char *format, va_list ap) {topEngineInstance->dumpMsg(path, format, ap);}
  void dumpUserMsg(const char *path, const char *format, va_list ap) {topEngineInstance->dumpUserMsg(path, format, ap);}
  void dumpWarning(const char *path, const char *format, va_list ap) {topEngineInstance->dumpWarning(path, format, ap);}
  void stop(int stopReason) {topEngineInstance->stop(stopReason);}
  void exit(int retval) {topEngineInstance->stop(GV_ENGINE_STOP_EXIT, retval);}
  void exit() {topEngineInstance->stop(GV_ENGINE_STOP_EXIT, topEngineInstance->getRetval());}
  void setRetval(int retval) {topEngineInstance->setRetval(retval);}
  int getRetval() {return topEngineInstance->getRetval();}
  void setFrequency(unsigned int freq) {
    period = 1e12/freq;
  }
  void keepRunning() {topEngineInstance->keepRunning();}
  void keepRunningCancel() {topEngineInstance->keepRunningCancel();}
  void pause() {topEngineInstance->pause();}
  void resume() {topEngineInstance->resume();}
  void setTime(int64_t time) {cycles = ceil((double)time / period);}
  void sync(gv::clockEngine *engine) {
    // This fonction is called when an engine is entering another one to synchronize it
    // Round the cycles to the upper value to model clock domain crossing
    cycles = ceil((double)engine->getTime() / period);
  }

private:
  unsigned long long period;
  int64_t cycles;
  int64_t time;
  int stage;
  int retval;
};

  typedef function<void ()> event_handle;

  class event {
public:
  event(engine *engine, event_handle handleFunc);

    int64_t getCycles() {return cycles;}
    int getStage() {return stage;}
    void setStage(int stage) {this->stage = stage;}
    int64_t getTime() {return engineInstance->getTime(cycles);}

    void enqueue(int64_t cycles, int stage) {
      if (enqueued) engineInstance->cancel(this);
      enqueued = true;
      this->cycles = cycles;
      this->stage = stage;
      engineInstance->enqueue(this);
    }
    void cancel() {
      if (enqueued)
      {
        enqueued = false;
        engineInstance->cancel(this);
      }
    }

  void enqueue(int64_t cycles) {
    enqueue(cycles, GV_ENGINE_STAGE_DEFAULT);
  }

  bool enqueued;
  event *getNext() {return next;}
  event *next;
  void handle() {
    enqueued = false;
    handleFunc();
  }
private:
  clockEngine *engineInstance;
  void *obj;
  void *info;
  event_handle handleFunc;
  int64_t cycles;
  int stage;
};

#endif

  class trace {
  public:
    trace() : isActive(false) {}
    bool isActive;
    const char *path;
    void dumpMsg(const char *fmt, ...);
    void dumpUserMsg(const char *fmt, ...);
    void dumpWarning(const char *fmt, ...);
    void setComponent(gv::component *comp);

  private:
    gv::component *comp;
  };

  class slavePort  {
  public:
    slavePort() :
      comp(NULL), next(NULL), slaveId(0)
    {
    }
    
    virtual ~slavePort() {}

    virtual slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) {return NULL;}

    void setName(string name) {this->name = strdup(name.c_str());}
    void setComp(gv::component *comp) {this->comp = comp;}
    
    unsigned long long getPortClass() {return (unsigned long long)this;}
    
    gv::component *comp;
    char *name;
    
    char *getName() {return name;}
    
  public:
    // This field is used for connection between master and multiple slaves
    slavePort *next;
    int slaveId;
  };
 
  typedef slavePort *masterPort;

  class inPort {
  public:
    uint32_t *data;
    gv::component *comp;
    gv::component *targetComp;
    bool *targetEval;
    int widthWords;
    inline void checkTarget();
    inline uint32_t read32();
    inline uint32_t readAt(int wordIndex);
    inline void copy(uint32_t *data);
  };

  class outPort {
  public:
    gv::masterPort port;
    uint32_t *data;
    int ioId;
    gv::component *comp;
    int targetIoId;
    gv::component *targetComp;
    bool *targetEval;
    bool *updated;

    inline void checkTarget();
    inline void write32(uint32_t value);

  };

  class combRegInit {
  public:
    combRegInit(gv::outPort *port, uint32_t *data) : port(port), data(data) {}
    gv::outPort *port;
    uint32_t *data;
  };

  class component  {
    
  public:
    component();
    void setEngine(unsigned long int engineInstance) {this->engineInstance = (engine *)engineInstance;}
    virtual int build() {return 0;}
    virtual int start() {return 0;}
    virtual void reset() {}
    virtual void close() {}
    virtual ~component() {}
    virtual void state(char *name) {}
    virtual bool memDump(unsigned int base, unsigned int size) {return false;}

    inline int64_t getCycles() {return getEngine()->getCycles();}

    void disAllBkp();
    void setBkp(unsigned int base, unsigned int size, unsigned int access);
    bool checkBkp(unsigned int base, unsigned int size, unsigned int access, unsigned int& matchAddr, unsigned int& matchAccess);

    void reg(gv::outPort *outPort, uint32_t *data, uint32_t **localData, gv::inPort *inPort);
    void regOut(string name, gv::outPort *port);
    void regIn(string name, uint32_t **data);
    void regIn(string name, gv::inPort *port, int size);
    void evalNetwork();
    void commitNetwork();

    void setNetwork(gv::component *network);
    virtual void eval() {}
    virtual void precommit() {}
    virtual void commit() {}
    void syncNextCycle();
    void syncNextCycle(gv::component *comp);
    void syncOut(gv::outPort *port);
    void syncOut(gv::component *comp, gv::outPort *port);
    void addCell(gv::component *comp);
    void connectNetworkOutputs();

    void regSlave(string name, slavePort *port);


    bool registerPowerTrace(gv::powerTrace **trace, char *name);
    void confPowerTrace(gv::powerTrace *trace);
    void confVcdTrace(gv::vcdTrace *trace, const char *path, bool isActive, long int file);

    slavePort *getSlavePort(char *name) {
      return slavePorts[name];
    }
    
    slavePort *getSlavePortResync(unsigned long long initiatorEngine, slavePort *port) {
      return port->getSlavePortResync((gv::clockEngine *)initiatorEngine, (gv::clockEngine *)getEngine());
    }

    void regMaster(string name, masterPort *port) {
      masterPorts.emplace(name, port);
      masterPortNames.push_back(name);
      if (port) *port = NULL;
    }
    
    const char *getMasterName(unsigned int index) {
      if (index >= masterPortNames.size()) return NULL;
      return masterPortNames[index].c_str();
    }

    const char *getSlaveName(unsigned int index) {
      if (index >= slavePortNames.size()) return NULL;
      return slavePortNames[index].c_str();
    }

    trace *getTrace(const char *name) {
      return traces[name];
    }

    gv::vcdTrace *getVcdTrace(const char *name) {
      return vcdTraces[name];
    }

    const char *getTraceName(unsigned int index) {
      if (index >= traceNames.size()) return NULL;
      return traceNames[index].c_str();
    }

    const char *getVcdTraceName(unsigned int index) {
      if (index >= vcdTraceNames.size()) return NULL;
      return vcdTraceNames[index].c_str();
    }

    void linkMasterTo(const char *name, slavePort *slavePort);

    void regTrace(string name, trace *tr) {
      traces.emplace(name, tr);
      tr->setComponent(this);
      traceNames.push_back(name);
    }
    
    void regVcd(string name, gv::vcdTrace *vcd, int width) {
      vcd->isString = false;
      vcd->width = width;
      vcdTraces.emplace(name, vcd);
      vcd->setComponent(this);
      vcdTraceNames.push_back(name);
    }
  
    void regVcdString(string name, gv::vcdTrace *vcd) {
      vcd->isString = true;
      vcdTraces.emplace(name, vcd);
      vcd->setComponent(this);
      vcdTraceNames.push_back(name);
    }
  
    trace *getUserTrace() {return &userTrace;}
    engine *getEngine() {return engineInstance;}
    gv::powerEngine *getPowerEngine() {return getEngine()->getPowerEngine();}
    void confTrace(const char *name, const char *path, bool active);

    inline void reorderCell(component *nextComp) 
    {
      dequeueCell();
      prevCell = nextComp->prevCell;
      nextCell = nextComp;
      if (prevCell) prevCell->nextCell = this;
      else network->firstCell = this;
      nextComp->prevCell = this;
      network->evalCell = this;
      component *comp = this;
      while(comp != NULL)
	{
	  comp->evaluated = false;
	  comp = comp->nextCell;
	}
    }

    inline void dequeueCell() 
    {
      if (prevCell) prevCell->nextCell = nextCell;
      else network->firstCell = nextCell;
      if (nextCell) nextCell->prevCell = prevCell;
      else network->lastCell = prevCell;
    }

  private:
    char *name;
    engine* engineInstance;
    vector<string> slavePortNames;
    vector<string> masterPortNames;
    vector<string> traceNames;
    vector<string> vcdTraceNames;
    unordered_map<string, slavePort *> slavePorts;
    unordered_map<string, slavePort **> masterPorts;
    unordered_map<string, trace *> traces;
    unordered_map<string, gv::vcdTrace *> vcdTraces;
    unordered_map<uint32_t, uint32_t> bkps;
    vector<combRegInit *> combRegInits;
    // Always active trace used to display messages to the user
    trace userTrace; 
    component *prevEvalCell;
    component *firstCell;
    component *lastCell;
    component *nextCell;
    component *prevCell;
    gv::event *evalEvent;
    gv::event *commitEvent;
    bool updated;

  public:
    gv::component *network = NULL;
    bool evaluated;
    char *path;
    component *evalCell;
    
  private:
    gv::powerTrace *firstPowerTrace;
    unordered_map<string, gv::powerTrace *> powerTraces;
  };


typedef function<void ()> callback_handle;

class callback {
  friend class callbackFifo;
private:
  callback_handle handler;
  callback *next;
public:
  callback(callback_handle handler) : handler(handler) {}
  void exec() { handler(); }
};

class callbackFifo {
private:
  callback *first;
  callback *last;
public:
  callbackFifo() : first(NULL), last(NULL) {}
  void push(callback *callback);
  callback *pop();
  void popAndExec();
};

  /*
   * IO protocol 
   */

#define GV_IOREQ_ERROR   1
#define GV_IOREQ_STALLED 2

#define GV_IOREQ_NB_STALL_DATA 16

class ioReq;

typedef function<bool (ioReq *req)> ioSlave_ioReq;

class ioReq {
public:
  ioReq(component *initiator, uint32_t addr, uint8_t *data, uint32_t size, bool isRead) :
    initiator(initiator), engineInstance(initiator->getEngine()), addr(addr), data(data), size(size), isRead(isRead), startTime(initiator->getEngine()->getCycles()), latency(0), duration(0), debug(false), secure(false), error(0)
  {}
  uint32_t getAddr() {return addr;}
  void setAddr(uint32_t addr) {this->addr = addr;}

  uint8_t *getData() {return data;}
  void setData(uint8_t *data) {this->data = data;}

  uint32_t getSize() {return size;}
  void setSize(uint32_t size) {this->size = size;}

  bool getIsRead() {return isRead;}
  void setIsRead(bool isRead) {this->isRead = isRead;}

  void setLatency(int64_t newLatency) {
    latency = newLatency;
  }

  void incLatency(int64_t incr) {
    latency += incr;
  }

  // Set packet duration in cycles
  void setLength(int64_t newDuration) {
    if (newDuration > duration) duration = newDuration;
  }

  int64_t getStartCycles() {return startTime;}

  // Returns the beginning of packet in cycles
  int64_t getLatency() {return latency;}

  // Returns the duration of the packet in cycles
  int64_t getLength() {return duration;}

  // Returns the end of packet in cycles
  int64_t getEndCycles() {return startTime + latency + duration;}

  void switchEngine(gv::clockEngine *engine) {
    engine->sync((gv::clockEngine *)engineInstance);
    double ratio = (double)engineInstance->getPeriod() / engine->getPeriod();
    if (ratio != 1.0) {
      // Always round up in order to model clock domain crossing
      startTime = ceil(startTime*ratio);
      latency = ceil(latency*ratio);
      duration = ceil(duration*ratio);
      engineInstance = engine;
    }
  }

  engine *getEngine() { return engineInstance; }

  void setDebug(bool value) { debug = value; }
  bool getDebug() { return debug; }
  void setSecure(bool value) { secure = value; }
  bool getSecure() { return secure; }
  
private:

  component *initiator;
  engine *engineInstance;
  uint32_t addr;
  uint8_t *data;
  uint32_t size;
  bool isRead;
  int64_t startTime;
  int64_t latency;
  int64_t duration;
  ioReq *initiatorReq;
  bool debug;
  bool secure;

public:
  int error;
  ioSlave_ioReq stallCallback;
  ioSlave_ioReq stallRetryCallback;
  unsigned int stallData[GV_IOREQ_NB_STALL_DATA];
  ioReq *next;
};

#define IO_SLAVE_IOREQ(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)
  
  class ioSlave : public slavePort {
  public:
    ioSlave(ioSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      ioReq(std::bind(&gv::ioSlave::ioReqResync, this, std::placeholders::_1)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
    {}
    ioSlave(ioSlave_ioReq ioReq) :
      ioReq(ioReq)
    {}
    ioSlave_ioReq ioReq;
    ioSlave *resyncTarget;
    
    gv::clockEngine *initiatorEngine;
    gv::clockEngine *targetEngine;
    
    // The IO req interface that must be called when going to a different clock domain
    bool ioReqResync(gv::ioReq *req);
      
    slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
  };
  
  typedef ioSlave * ioMaster;
  








  typedef function<void (gv::outPort *, uint32_t *)> combSlave_reg;
  
#define COMB_SLAVE_REG(meth, args...) std::bind(meth, this, std::placeholders::_1, std::placeholders::_2, ##args)
  
  /*
   * Comb protocol
   */

class combSlave : public slavePort {
public:
  
    combSlave(combSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      regMeth(std::bind(&gv::combSlave::regResync, this, std::placeholders::_1, std::placeholders::_2)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
  {}

  combSlave(combSlave_reg reg) : 
    regMeth(reg)
  {}

  combSlave_reg regMeth;
  combSlave *resyncTarget;

  gv::clockEngine *initiatorEngine;
  gv::clockEngine *targetEngine;

  void regResync(gv::outPort *outPort, uint32_t *data);

  // We use this stub to call all the slaves to which the master is connected
  void reg(gv::outPort *outPort, uint32_t *data) {
    regMeth(outPort, data);
    if (next) ((combSlave *)next)->reg(outPort, data);
  }

  slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
};

  typedef combSlave *combMaster;







  typedef function<void (uint32_t)> wireSlave_sync;
  
#define WIRE_SLAVE_SYNC(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)
  

  /*
   * Bitstream protocol
   */

class bsReq {
public:
  bsReq(component *initiator, int headerSize, int dataSize, int dataLen=0) :
    initiator(initiator), engineInstance(initiator->getEngine()), startTime(initiator->getEngine()->getCycles()), latency(0), duration(0), dataHead(0), dataSize(dataSize), dataLen(dataLen)
  {
    if (dataLen == 0) dataLen = dataSize * 8;
    header = new uint8_t[headerSize];
    data = new uint8_t[dataSize];
  }
  ~bsReq() {
    delete header;
    delete data;
  }

  bool getIsRead() {return isRead;}
  uint8_t *getData() {return data;}
  int getDataHead() {return dataHead;}
  void setDataHead(int head) {dataHead = head;}
  uint8_t *getHeader() {return header;}
  void setNext(bsReq *req) {next = req;}
  bsReq *getNext() {return next;}
  int getDataSize() {return dataSize;}
  int getDataLen() {return dataLen;}
  void setLatency(int64_t latency) {this->latency = latency;}
  int64_t getLatency() { return latency; }
  void setDataSize(int _dataSize) {dataSize = _dataSize;}

  void switchEngine(gv::clockEngine *engine) {
    engine->sync((gv::clockEngine *)engineInstance);
    double ratio = (double)engineInstance->getPeriod() / engine->getPeriod();
    if (ratio != 1.0) {
      // Always round up in order to model clock domain crossing
      startTime = ceil(startTime*ratio);
      latency = ceil(latency*ratio);
      duration = ceil(duration*ratio);
      engineInstance = engine;
    }
  }

public:

#ifndef __SWIG__
  component *initiator;
  engine *engineInstance;
  int64_t startTime;
  int64_t latency;
  int64_t duration;
  ioReq *initiatorReq;
  uint8_t *header;
  uint8_t *data;
  bool isRead;
  int dataHead;
  bsReq *next;
  int dataSize;
  int dataLen;
#endif
};

  typedef function<bool (bsReq *req)> bsSlave_bsReq;
  typedef function<void (uint8_t *data, unsigned int dataLen, int64_t *latency)> bsSlave_bsData;

#define BS_SLAVE_BSREQ(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)
#define BS_SLAVE_BSDATA(meth, args...) std::bind(meth, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3, ##args)
  
  class bsSlave : public slavePort {
  public:
    bsSlave(bsSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      bsReqMeth(std::bind(&gv::bsSlave::bsReqResync, this, std::placeholders::_1)), bsDataMeth(std::bind(&gv::bsSlave::bsDataResync, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
    {}
    bsSlave(bsSlave_bsReq bsReq, bsSlave_bsData bsData) :
      bsReqMeth(bsReq), bsDataMeth(bsData)
    {}
    bsSlave_bsReq bsReqMeth;
    bsSlave_bsData bsDataMeth;
    bsSlave *resyncTarget;
    
    gv::clockEngine *initiatorEngine;
    gv::clockEngine *targetEngine;
    
    // The BS req interface that must be called when going to a different clock domain
    bool bsReqResync(gv::bsReq *req);
    void bsDataResync(uint8_t *data, unsigned int dataLen, int64_t *latency);
    
    // We use this stub to call all the slaves to which the master is connected
    bool bsReq(gv::bsReq *req) {
      bool result = bsReqMeth(req);
      if (next) result |= ((bsSlave *)next)->bsReq(req);
      return result;
    }
    void bsData(uint8_t *data, unsigned int dataLen, int64_t *latency) {
      bsDataMeth(data, dataLen, latency);
      if (next) ((bsSlave *)next)->bsData(data, dataLen, latency);
    }

    slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
  };
  
  typedef bsSlave * bsMaster;
  
  typedef function<void (uint32_t)> wireSlave_sync;
  
#define WIRE_SLAVE_SYNC(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)
  
  // SPI
  typedef struct {
    unsigned int cmd;
    unsigned int addr;
    unsigned int len;
    bool cs;
  } spiHeader;

  /*
   * Wire protocol
   */

class wireSlave : public slavePort {
public:
  
    wireSlave(wireSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      syncMeth(std::bind(&gv::wireSlave::syncResync, this, std::placeholders::_1)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
  {}

  wireSlave(wireSlave_sync sync) : 
    syncMeth(sync)
  {}

  wireSlave_sync syncMeth;
  wireSlave *resyncTarget;

  gv::clockEngine *initiatorEngine;
  gv::clockEngine *targetEngine;

  void syncResync(uint32_t value);

  // We use this stub to call all the slaves to which the master is connected
  void sync(uint32_t value) {
    syncMeth(value);
    if (next) ((wireSlave *)next)->sync(value);
  }

  slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
};

  typedef wireSlave *wireMaster;

  /*
   * CPU control protocol
   */

typedef function<bool (uint32_t reg, int isRead, uint32_t *value)> cpuCtrlSlave_regAccess;

#define CPU_CTRL_SLAVE_REG_ACCESS(meth, args...) std::bind(meth, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3, ##args)

class cpuCtrlSlave : public slavePort {
public:
    cpuCtrlSlave(cpuCtrlSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      regAccess(std::bind(&gv::cpuCtrlSlave::regAccessResync, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
  {}

  cpuCtrlSlave(cpuCtrlSlave_regAccess regAccess) :
    regAccess(regAccess)
  {}

  cpuCtrlSlave_regAccess regAccess;
  cpuCtrlSlave *resyncTarget;

  gv::clockEngine *initiatorEngine;
  gv::clockEngine *targetEngine;


  bool regAccessResync(uint32_t reg, int isRead, uint32_t *value);

  slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
};

  typedef cpuCtrlSlave *cpuCtrlMaster;


  /*
   * Cache control protocol
   */

typedef function<void (bool enable)> cacheCtrlSlave_enable;
typedef function<void ()> cacheCtrlSlave_flushAll;
typedef function<void (unsigned int addr)> cacheCtrlSlave_flushLine;

#define CACHE_CTRL_SLAVE_ENABLE(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)
#define CACHE_CTRL_SLAVE_FLUSH_ALL(meth, args...) std::bind(meth, this, ##args)
#define CACHE_CTRL_SLAVE_FLUSH_LINE(meth, args...) std::bind(meth, this, std::placeholders::_1, ##args)

class cacheCtrlSlave : public slavePort {
public:
    cacheCtrlSlave(cacheCtrlSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      enable(std::bind(&gv::cacheCtrlSlave::enableResync, this, std::placeholders::_1)), flushAll(std::bind(&gv::cacheCtrlSlave::flushAllResync, this)), flushLine(std::bind(&gv::cacheCtrlSlave::flushLineResync, this, std::placeholders::_1)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
  {}

  cacheCtrlSlave(cacheCtrlSlave_enable enable, cacheCtrlSlave_flushAll flushAll, cacheCtrlSlave_flushLine flushLine) :
    enable(enable),
    flushAll(flushAll),
    flushLine(flushLine)
  {}

  cacheCtrlSlave_enable enable;
  cacheCtrlSlave_flushAll flushAll;
  cacheCtrlSlave_flushLine flushLine;
  cacheCtrlSlave *resyncTarget;

  gv::clockEngine *initiatorEngine;
  gv::clockEngine *targetEngine;


  void enableResync(bool enable);
  void flushAllResync();
  void flushLineResync(unsigned int addr);

  slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);
};

  typedef cacheCtrlSlave *cacheCtrlMaster;


  /*
   * REG access
   */

  typedef function<int (int *slaveId, int isRead, uint64_t *value)> regSlave_regAccess;

#define REG_SLAVE_REG_ACCESS(meth, args...) std::bind(meth, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3, ##args)

class regSlave : public slavePort {
public:
    regSlave(regSlave *resyncTarget, gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine) :
      regAccessMeth(std::bind(&gv::regSlave::regAccessResync, this, std::placeholders::_1, std::placeholders::_2, std::placeholders::_3)), resyncTarget(resyncTarget), initiatorEngine(initiatorEngine), targetEngine(targetEngine)
  {}

  regSlave(regSlave_regAccess regAccess) :
    regAccessMeth(regAccess)
  {}

  regSlave_regAccess regAccessMeth;
  regSlave *resyncTarget;

  gv::clockEngine *initiatorEngine;
  gv::clockEngine *targetEngine;

  int regAccessResync(int *slaveId, int isRead, uint64_t *value);

  // We use this stub to call all the slaves to which the master is connected
  int regAccess(int *slaveId, int isRead, uint64_t *value) {
    if (slaveId == NULL || *slaveId == this->slaveId)
      {
	regAccessMeth(slaveId, isRead, value);
	if (slaveId != NULL) *slaveId = *slaveId + 1;
	// The final slave always consider it is over, in case it is a single slave
	return 1;
      }
    else
      {
	if (next) ((regSlave *)next)->regAccess(slaveId, isRead, value);
	return *slaveId > this->slaveId;
      }
  }

  slavePort *getSlavePortResync(gv::clockEngine *initiatorEngine, gv::clockEngine *targetEngine);

};

typedef regSlave *regMaster;







  inline int64_t gv::topEngine::getNextEventTime() {
  // TODO
#if 0
  if (first == NULL) return -1;
  else return first->time;
#endif
  return 0;
}


  inline void outPort::checkTarget()
  {
    if (targetEval && *targetEval && comp->network->evalCell)
      {
	comp->reorderCell(targetComp);
      }
  }

  inline void inPort::checkTarget()
  {
    if (targetEval && !*targetEval && comp->network->evalCell)
    {
      targetComp->reorderCell(comp);
      throw 1;
    }
  }
  
  inline void outPort::write32(uint32_t value) {
    *updated = true;
    //checkTarget();
    *data = value;
  }

  inline uint32_t inPort::read32() {
    checkTarget();
    return *data;
  }

  inline uint32_t inPort::readAt(int wordIndex)
  {
    checkTarget();
    return data[wordIndex];
  }

  inline void inPort::copy(uint32_t *dst)
  {
    checkTarget();
    std::memcpy(dst, data, widthWords*4);
  }

};

#endif
