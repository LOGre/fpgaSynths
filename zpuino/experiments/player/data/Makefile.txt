CXXFLAGS=-O0 -g
LIBS=-lutil -lpthread

all: LineStreamServer

LineStreamServer: LineStreamServer.o LineStreamClient.o
	$(CXX) -o $@ $+ $(LIBS)
	
	