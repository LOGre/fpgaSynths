CXXFLAGS=-O0 -g
LIBS=-lutil -lpthread

all: LineStreamServer

clean:
	@rm -rf *.o LineStreamServer

LineStreamServer: main.o TransmitQueue.o LineStreamServer.o LineStreamClient.o Serial.o
	$(CXX) -o $@ $+ $(LIBS)
	
	
