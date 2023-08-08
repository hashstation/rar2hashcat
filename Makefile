# Common variables
CFLAGS = -g -static -O2 -D_GNU_SOURCE -DARCH_LITTLE_ENDIAN=1
TARGET = rar2hashcat

# Variables for Linux target
CC_LINUX = gcc
TARGET_LINUX = $(TARGET)

# Variables for Windows (cross-compiled) target
CC_WIN = x86_64-w64-mingw32-gcc
TARGET_WIN = $(TARGET).exe

# List of source files
SOURCES = $(TARGET).c base64_convert.c

all: $(TARGET_LINUX) $(TARGET_WIN)

# Build target for Linux
$(TARGET_LINUX): $(SOURCES)
	$(CC_LINUX) $(CFLAGS) $^ -o $@

# Build target for Windows
$(TARGET_WIN): $(SOURCES)
	$(CC_WIN) $(CFLAGS) $^ -o $@

clean:
	rm -f $(TARGET_LINUX) $(TARGET_WIN)