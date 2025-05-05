FROM ubuntu:20.04

RUN apt update

# Download toolchain files
RUN apt install -y wget
RUN wget https://kozos.jp/books/makeos/binutils-2.19.1.tar.gz && \
    tar zxvf binutils-2.19.1.tar.gz
RUN wget https://kozos.jp/books/makeos/gcc-3.4.6.tar.gz && \
    tar zxvf gcc-3.4.6.tar.gz

# Install dependencies
RUN apt install -y build-essential

# Build binutils
RUN cd binutils-2.19.1 && \
    ./configure --target=h8300-elf --disable-nls --disable-werror && \
    make && \
    make install

# Copy necessary patches
COPY patches/ gcc-3.4.6/patches/

# Build compiler
RUN cd gcc-3.4.6 && \
    patch gcc/collect2.c patches/collect2.patch && \
    patch gcc/config/h8300/h8300.c patches/h8300.patch && \
    ./configure --target=h8300-elf --disable-nls --disable-threads \
                --disable-shared --enable-languages=c --disable-werror && \
    make && \
    make install

# Show toolchain version
RUN h8300-elf-readelf -v
RUN h8300-elf-gcc -v

# Install devtools
RUN apt install -y git git-lfs clang-format
