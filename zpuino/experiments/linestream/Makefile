CXXFLAGS=-O0 -g -I"lib/"
LIBS=-lutil -lpthread -L./lib/ ./lib/liblinestream.a -llinestream

all: LineStreamServer

clean:
	@rm -rf *.o LineStreamServer

LineStreamServer: main.o TransmitQueue.o LineStreamServer.o LineStreamClient.o Serial.o
	$(CXX) -o $@ $+ $(LIBS)
	
	
