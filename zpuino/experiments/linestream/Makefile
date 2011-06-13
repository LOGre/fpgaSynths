CXXFLAGS=-O0 -g
LIBS=-lutil -lpthread

all: LineStreamServer

LineStreamServer: main.o TransmitQueue.o LineStreamServer.o LineStreamClient.o
	$(CXX) -o $@ $+ $(LIBS)
	
	
