#!/usr/bin/env python3

import os
import sys
from sqlalchemy import Table, Column, ForeignKey, Integer, String, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, backref
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from prettytable import PrettyTable
import datetime

Base = declarative_base()

class TestResult(Base):
    __tablename__ = 'testresults'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    date = Column(DateTime)
    status = Column(String(50))
    test_id = Column(Integer, ForeignKey('tests.id'))
    test = relationship("Test")
    build_id = Column(Integer, ForeignKey('builds.id'))
    build = relationship("Build")

class Test(Base):
    __tablename__ = 'tests'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    date = Column(DateTime)
    testsuite = Column(String(50))
    module = Column(String(50))
    test = Column(String(50))
    description = Column(String(50))

    def getFullName(self):
        names = []
        if self.testsuite != None: names.append(self.testsuite)
        if self.module != None: names.append(self.module)
        if self.test != None: names.append(self.test)
        return ':'.join(names)

    def filter(query, fields):
        if fields.get('test'):
            test = fields.pop('test')
            query = query.filter(Test.name == test)
        return query

class Metric(Base):
    __tablename__ = 'metrics'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    name = Column(String(50))
    unit = Column(String(50))
    description = Column(String(50))

    def getValuesForResult(self):
        return [self.name, self.unit]

    def filter(query, fields):
        if fields.get('metric') != None:
            metric = fields.pop('metric')
            query = query.filter(Metric.name == metric)
        if fields.get('unit') != None:
            unit = fields.pop('unit')
            query = query.filter(Metric.unit == unit)
        return query

class Bench(Base):
    __tablename__ = 'benchmarks'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    testsuite = Column(String(50))
    module = Column(String(50))
    test = Column(String(50))
    name = Column(String(50))
    metric = Column(Integer, ForeignKey('metrics.id'))
    metricChild = relationship("Metric")
    description = Column(String(50))

    def filter(query, fields):
        query = Metric.filter(query, fields)

        if fields.get('bench'):
            bench = fields.pop('bench')
            query = query.filter(Bench.name == bench)
        return query

    def getValuesForResult(self):
        return [self.testsuite, self.module, self.test, self.name] + self.metricChild.getValuesForResult()

    def getFullName(self):
        names = []
        if self.testsuite != None: names.append(self.testsuite)
        if self.module != None: names.append(self.module)
        if self.test != None: names.append(self.test)
        if self.name != None: names.append(self.name)
        return ':'.join(names)

class Source(Base):
    __tablename__ = 'sources'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    module = Column(String(50))
    version = Column(String(50))
    date = Column(DateTime)

build_dep_association_table = Table('build_deps_association', Base.metadata,
    Column('build_id', Integer, ForeignKey('builds.id'), primary_key=True),
    Column('dep_id', Integer, ForeignKey('builds.id'), primary_key=True)
)

class Build(Base):
    __tablename__ = 'builds'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    date = Column(DateTime)
    startDate = Column(DateTime)
    package_id = Column(Integer, ForeignKey('tags.id'))
    artefact_id = Column(Integer)
    package = relationship("Tag")
    status = Column(String(50))
    build = relationship("Build",
                       secondary=build_dep_association_table,
                       primaryjoin=id==build_dep_association_table.c.build_id,
                       secondaryjoin=id==build_dep_association_table.c.dep_id,
                       backref="builds")


dep_association_table = Table('deps_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tags.id'), primary_key=True),
    Column('dep_id', Integer, ForeignKey('tags.id'), primary_key=True)
)

source_association_table = Table('sources_association', Base.metadata,
    Column('tag_id', Integer, ForeignKey('tags.id')),
    Column('source_id', Integer, ForeignKey('sources.id'))
)

class Tag(Base):
    __tablename__ = 'tags'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    date = Column(DateTime)
    package = Column(String(50))
    tag = Column(String(50))
    source = relationship("Source",
                          secondary=source_association_table,
                          backref="sources")

    dep = relationship("Tag",
                       secondary=dep_association_table,
                       primaryjoin=id==dep_association_table.c.tag_id,
                       secondaryjoin=id==dep_association_table.c.dep_id,
                       backref="deps")

association_table = Table('association', Base.metadata,
    Column('result_id', Integer, ForeignKey('results.id')),
    Column('environment_id', Integer, ForeignKey('environments.id'))
)

param_association_table = Table('param_association', Base.metadata,
    Column('result_id', Integer, ForeignKey('results.id')),
    Column('param_id', Integer, ForeignKey('parameters.id'))
)

class Result(Base):
    __tablename__ = 'results'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    value = Column(String(50))
    date = Column(DateTime)
    bench_id = Column(Integer, ForeignKey('benchmarks.id'))
    bench = relationship("Bench")
    test_id = Column(Integer, ForeignKey('tests.id'))
    test = relationship("Test")
    status = Column(String(50))
    #env = Column(Integer, ForeignKey('environments.id'))
    #environments2 = relationship("Env", order_by="Env.id", backref="result")
    children = relationship("Env",
                    secondary=association_table,
                    backref="results")
    param = relationship("Param",
                    secondary=param_association_table,
                    backref="params")

    def getFullName(self):
        if self.bench != None:
            return self.bench.getFullName()
        else:
            return self.test.getFullName()

    def getMetric(self):
        if self.bench != None:
            return self.bench.metricChild
        else:
            return None

    def getResult(self):
        if self.bench != None:
            return self.value
        else:
            return self.status

class Env(Base):
    __tablename__ = 'environments'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    name = Column(String(50))
    value = Column(String(50))
    description = Column(String(50))
    parent = relationship("Result",
                    secondary=association_table,
                    backref="envs")
   
class Param(Base):
    __tablename__ = 'parameters'
    id = Column(Integer, primary_key=True)
    author = Column(String(50))
    name = Column(String(50))
    value = Column(String(50))
    description = Column(String(50))
    parent = relationship("Result",
                    secondary=param_association_table,
                    backref="params")

    def filter(query, fields, params):
        for name, value in params.items():
            query = query.filter(Param.name == name, Param.value == value)
        return query
   
class MetricsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Metric).filter_by(**kwargs).all()    

    def dump(self, **kwargs):
        metrics = self.session.query(Metric).all()

        x = PrettyTable(Metric.__mapper__.columns.keys())
        for metric in metrics:
            x.add_row([metric.id, metric.author, metric.name, metric.unit, metric.description])

        print(x)

    def getKeysForResult():
        return ['metric', 'unit']

    def reg(self, name, **kwargs):
        dbItem = self.get(name=name)
        if len(dbItem) != 0: return dbItem[0]
        
        newMetric = Metric(author=os.environ.get('USER'), name=name, **kwargs)
        self.session.add(newMetric)
        self.session.commit()

        return newMetric

class TestResultsTable(object):

    def __init__(self, session):
        self.session = session

    def delete(self, **kwargs):
        return self.session.query(TestResult).filter_by(**kwargs).delete()    

    def get(self, **kwargs):
        return self.session.query(TestResult).filter_by(**kwargs).all()    

    def reg(self, status, test, envs, **kwargs):
        newTestResult = TestResult(author=os.environ.get('USER'), date=datetime.datetime.today(), status=status, test=test, **kwargs)
        for env in envs:
            env = self.session.query(Env).filter_by(id=env).first()
            newTestResult.envs.append(env)

        self.session.add(newTestResult)
        self.session.commit()

        return newTestResult

class TestsTable(object):

    def __init__(self, session):
        self.session = session

    def delete(self, **kwargs):
        return self.session.query(Test).filter_by(**kwargs).delete()    

    def get(self, **kwargs):
        return self.session.query(Test).filter_by(**kwargs).all()    

    def reg(self, test, **kwargs):
        newTest = Test(author=os.environ.get('USER'), date=datetime.datetime.today(), test=test, **kwargs)
        self.session.add(newTest)
        self.session.commit()

        return newTest

class BuildsTable(object):

    def __init__(self, session):
        self.session = session

    def delete(self, **kwargs):
        return self.session.query(Build).filter_by(**kwargs).delete()    

    def get(self, **kwargs):
        return self.session.query(Build).filter_by(**kwargs).all()    

    def findOrReg(self, status, package, **kwargs):
        dbBuild = self.get(status=status, package=package, **kwargs)
        if len(dbBuild) != 0: return dbBuild[0]
        else: return self.reg(status=status, package=package, **kwargs)

    def reg(self, status, package, **kwargs):
        newBuild = Build(author=os.environ.get('USER'), date=datetime.datetime.today(), status=status, package=package, **kwargs)
        self.session.add(newBuild)
        self.session.commit()

        return newBuild

    def update(self):
        self.session.commit()

    def dump(self, packages=None, **kwargs):
        builds = self.get(**kwargs)

        x = PrettyTable(['package', 'tag', 'date', 'status'])
        for build in builds:
            if packages != None and not build.package.package in packages: continue
            x.add_row([build.package.package, build.package.tag, build.date, build.status])

        print(x)

class TagsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Tag).filter_by(**kwargs).all()    

    def reg(self, tag, package, **kwargs):

        dbTag = self.get(tag=tag, package=package)
        if len(dbTag) != 0: return dbTag[0]
        
        newTag = Tag(author=os.environ.get('USER'), date=datetime.datetime.today(), tag=tag, package=package, **kwargs)
        self.session.add(newTag)
        self.session.commit()

        return newTag


class SourcesTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Source).filter_by(**kwargs).all()    

    def reg(self, module, version, **kwargs):

        dbSource = self.get(module=module, version=version)
        if len(dbSource) != 0: return dbSource[0]
        
        newSource = Source(author=os.environ.get('USER'), date=datetime.datetime.today(), module=module, version=version, **kwargs)
        self.session.add(newSource)
        self.session.commit()

        return newSource

class BenchsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Bench).filter_by(**kwargs).all()    

    def getKeysForResult():
        return ['testsuite', 'module', 'test', 'bench'] + MetricsTable.getKeysForResult()

    def dump(self, **kwargs):
        benchs = self.session.query(Bench).all()

        x = PrettyTable(Bench.__mapper__.columns.keys())
        for bench in benchs:
            x.add_row([bench.id, bench.author, bench.testsuite, bench.module, bench.test, bench.name, bench.metric, bench.description])

        print(x)

    def reg(self, testsuite, module, test, name, **kwargs):
        dbItem = self.get(name=name, testsuite=testsuite, module=module, test=test)
        if len(dbItem) != 0: return dbItem[0]
        newBench = Bench(author=os.environ.get('USER'), name=name, testsuite=testsuite, module=module, test=test, **kwargs)
        self.session.add(newBench)
        self.session.commit()
        return newBench

class EnvsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Env).filter_by(**kwargs).all()    

    def dump(self, **kwargs):
        envs = self.session.query(Env).all()

        x = PrettyTable(Env.__mapper__.columns.keys())
        for env in envs:
            x.add_row([env.id, env.author, env.name, env.value, env.description])

        print(x)

    def reg(self, name, value, **kwargs):
        dbItem = self.get(name=name, value=value)
        if len(dbItem) != 0: return dbItem[0]
        newEnv = Env(author=os.environ.get('USER'), name=name, value=value, **kwargs)
        self.session.add(newEnv)
        self.session.commit()
        return newEnv

class ParamsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        return self.session.query(Param).filter_by(**kwargs).all()    

    def dump(self, **kwargs):
        params = self.get(**kwargs)

        x = PrettyTable(Param.__mapper__.columns.keys())
        for param in params:
            x.add_row([param.id, param.author, param.name, param.value, param.description])

        print(x)

    def reg(self, name, value, **kwargs):
        dbParam = self.get(name=name, value=value)
        if len(dbParam) != 0: return dbParam[0]
        
        newParam = Param(author=os.environ.get('USER'), name=name, value=value, **kwargs)
        self.session.add(newParam)
        self.session.commit()

        return newParam

class ResultsTable(object):

    def __init__(self, session):
        self.session = session

    def get(self, **kwargs):
        params = kwargs.get('params')
        envs = kwargs.get('envs')

        query = self.session.query(Result).join(Result.params, Result.envs)

        if params != None:
            if len(params):
                isFirst = True
                for key,value in params.items():
                    filterExpr = Result.param.any(name=key, value=value)
                    if isFirst:
                        isFirst = False
                        filterExprList = filterExpr
                    else:
                        filterExprList &= filterExpr
                query = query.filter(filterExprList)
            del kwargs['params']

        if kwargs.get('status') != None:
            query = Test.filter(query, fields=kwargs)
        else:
            query = Bench.filter(query, fields=kwargs)

        if envs != None:
            if len(envs):
                isFirst = True
                for key,value in envs.items():
                    filterExpr = Result.envs.any(name=key, value=value)
                    if isFirst:
                        isFirst = False
                        filterExprList = filterExpr
                    else:
                        filterExprList &= filterExpr
                    query = query.filter(filterExprList)
            del kwargs['envs']

        if kwargs.get('status') != None:
            query = Test.filter(query, fields=kwargs)
        else:
            query = Bench.filter(query, fields=kwargs)

        results = query.filter_by(**kwargs).all()

        return results

    def find(self, **kwargs):
        return self.session.query(Result).filter(*kwargs).all()

    def dump(self, **kwargs):
        results = self.get(**kwargs)

        self.dumpFiltered(results)

    def dumpFiltered(self, results):

        keys = ['id', 'name', 'value', 'env', 'params']

        x = PrettyTable(keys)
        for result in results:

            if result.test != None:
                valueList = [result.id, result.test.getFullName(), result.status]
            else:
                valueList = [result.id, result.bench.getFullName(), result.value]

            envList = []
            for env in result.envs:
                envList.append("%s=%s" % (env.name, env.value))
            valueList.append(':'.join(envList))

            paramList = []
            for param in result.params:
                paramList.append("%s=%s" % (param.name, param.value))
            valueList.append(':'.join(paramList))
            
            x.add_row(valueList)

        print(x)

    def dumpFiltered2(self, fields, envs={}, params={}):
        query = self.session.query(Result).join(Result.params, Result.benchChild)
        #query = Param.filter(query, fields=fields, params=params)

        if len(params):
            isFirst = True
            for key,value in params.items():
                filterExpr = Result.params.any(name=key, value=value)
                if isFirst:
                    isFirst = False
                    filterExprList = filterExpr
                else:
                    filterExprList &= filterExpr
                query = query.filter(filterExprList)
        query = Bench.filter(query, fields=fields)

        if len(envs):
            isFirst = True
            for key,value in envs.items():
                filterExpr = Result.envs.any(name=key, value=value)
                if isFirst:
                    isFirst = False
                    filterExprList = filterExpr
                else:
                    filterExprList &= filterExpr
                query = query.filter(filterExprList)
        query = Bench.filter(query, fields=fields)


        results = query.filter_by(**fields).all()
        #results = Bench.filter(self.session.query(Result).join(Result.benchChild),fields).filter_by(**fields).all()

        keys = Result.__mapper__.columns.keys()
        keys.remove('bench')
        keys += BenchsTable.getKeysForResult() + ['envs', 'params']

        x = PrettyTable(keys)
        for result in results:

            valueList = [result.id, result.author, result.value, result.date]

            valueList += result.benchChild.getValuesForResult()

            envList = []
            for env in result.envs:
                envList.append("%s=%s" % (env.name, env.value))
            valueList.append(':'.join(envList))
            
            paramList = []
            for param in result.params:
                paramList.append("%s=%s" % (param.name, param.value))
            valueList.append(':'.join(paramList))
            
            x.add_row(valueList)

        print(x)

    def reg(self, envs, params, **kwargs):
        newBench = Result(date=datetime.datetime.today(), author=os.environ.get('USER'), **kwargs)
        
        for env in envs:
            env = self.session.query(Env).filter_by(id=env).first()
            newBench.envs.append(env)

        for param in params:
            param = self.session.query(Param).filter_by(id=param.id).first()
            newBench.params.append(param)

        self.session.add(newBench)
        self.session.commit()

class PulpDb(object):

    def __init__(self, localFile=None):

        if os.environ.get('PULP_DB_FILE') != None:
            localFile = os.environ.get('PULP_DB_FILE')

        if localFile == None:
            engine = create_engine('mysql+mysqlconnector://pulpuser:pulpuser1234@iis-infra.ee.ethz.ch/pulpdb')
        else:
            engine = create_engine('sqlite:///%s' % (localFile))
        self.localFile = localFile
        self.engine = engine
        Base.metadata.bind = engine
        DBSession = sessionmaker()
        DBSession.bind = engine
        session = DBSession()
        self.metricsTable = MetricsTable(session)
        self.benchsTable = BenchsTable(session)
        self.resultsTable = ResultsTable(session)
        self.envsTable = EnvsTable(session)
        self.paramsTable = ParamsTable(session)
        self.buildsTable = BuildsTable(session)
        self.tagsTable = TagsTable(session)
        self.sourcesTable = SourcesTable(session)
        self.testResultsTable = TestResultsTable(session)
        self.testsTable = TestsTable(session)

    def getMetricsTable(self):
        return self.metricsTable

    def getBenchsTable(self):
        return self.benchsTable

    def getResultsTable(self):
        return self.resultsTable

    def getEnvsTable(self):
        return self.envsTable

    def getParamsTable(self):
        return self.paramsTable

    def getBuildsTable(self):
        return self.buildsTable

    def getTagsTable(self):
        return self.tagsTable

    def getSourcesTable(self):
        return self.sourcesTable

    def getTestResultsTable(self):
        return self.testResultsTable

    def getTestsTable(self):
        return self.testsTable

    def createTables(self):

        if self.localFile == None:
            engine = create_engine('mysql+mysqlconnector://pulpdbadmin:pulpdbadmin1234@iis-infra.ee.ethz.ch/pulpdb')
        else:
            engine = create_engine('sqlite:///%s' % (self.localFile))
        #Base.metadata.drop_all(engine)
        Base.metadata.create_all(engine)
