#ifndef LOG_H
#define LOG_H

class LogIF {
  public:
    virtual void user(char *str, ...) = 0;
    virtual void debug(char *str, ...) = 0;
};

#endif
