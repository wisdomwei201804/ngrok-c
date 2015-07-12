CC?=gcc
CXX?=g++
CFLAGS+=-fexceptions
CXXFLAGS+=-fexceptions
LIBS=sendmsg.o cJSON.o nonblocking.o sslbio.o main.o
all:: ngrokc $(LIBS)
ngrokc: $(LIBS)
	$(CXX) -s $(LIBS) -o ngrokc -lpthread -lpolarssl
sendmsg.o: sendmsg.h
cJSON.o: cJSON.h
nonblocking.o: nonblocking.h
sslbio.o: sslbio.h
main.o: sendmsg.h sslbio.h cJSON.h bytestool.h nonblocking.h

clean:
	rm -f $(LIBS) ngrokc
