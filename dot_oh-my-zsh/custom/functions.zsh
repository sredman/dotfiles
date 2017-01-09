# filename: functions.zsh
#
# created by: Graham Zuber
# github: github.com/gzuber
# email: grahamzuber@gmail.com
#
# created: 02.01.2017
# last modified: Sun Jan  8 20:58:58 2017
#
# description: 
#
# custom bash functions


# file path helpers
icloud () { cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"$1" }
drive () { cd ~/OneDrive/"$1" }
docs () { cd ~/OneDrive/documents/"$1" }
repos () { cd ~/OneDrive/repos/"$1" }


# setting up repo without structure or source
setrepo ()
{
    ~/.vim/plugged/YCM-Generator/config_gen.py $PWD

    ctags -R -f ./.tags .
}

# repo set up from scratch
repo ()
{
    git init
    mkdir src
    mkdir bin
    mkdir inc

    touch Makefile
    echo "# change these items" >> Makefile
    echo "SRC_TYPE = .c" >> Makefile
    echo "INC_TYPE = .h" >> Makefile
    echo "EXE = main\nDEXE = d_main" >> Makefile
    echo "CXX = gcc" >> Makefile
    echo "CXXFLAGS = -std=c89 -O2 -Wall" >> Makefile
    echo "EXTRAFLAGS = " >> Makefile
    echo "SETUP_FILE = setup" >> Makefile
    echo "\n\n" >> Makefile

    echo "SRC = src\nBIN = bin\nINC = inc\n\n" >> Makefile
    echo "INCLUDEFLAGS = -I\$(INC)" >> Makefile
    echo "SOURCES = \$(wildcard \$(SRC)/*\$(SRC_TYPE))" >> Makefile
    echo "OBJS = \$(SOURCES:src/%\$(SRC_TYPE)=bin/%.o)" >> Makefile
    echo "DOBJS = \$(OBJS:bin/%.o=bin/d_%.o)" >> Makefile

    echo "all: \$(EXE)" >> Makefile
	echo "\t@echo ========== finished build ==========" >> Makefile
	echo "\t@echo" >> Makefile
    echo "\n" >> Makefile

    echo "debug: \$(DEXE)" >> Makefile
	echo "\t@echo ========== finished build ==========" >> Makefile
	echo "\t@echo" >> Makefile
    echo "\n" >> Makefile

    echo "\$(EXE): \$(OBJS)" >> Makefile
	echo "\t@echo building executable "\$@"" >> Makefile
    echo "\t\$(CXX) \$(CXXFLAGS) \$(EXTRAFLAGS) \$(INCLUDEFLAGS) \$(OBJS) -o \$(EXE)" >> Makefile
    echo "\n" >> Makefile

    echo "\$(DEXE): \$(DOBJS)" >> Makefile
    echo "\t\$(CXX) \$(CXXFLAGS) \$(EXTRAFLAGS) \$(INCLUDEFLAGS) \$(DOBJS) -g -o \$(DEXE)" >> Makefile
    echo "\n" >> Makefile

    echo "\$(BIN)/%.o: \$(SRC)/%\$(SRC_TYPE) \$(INC)/%\$(INC_TYPE) begin" >> Makefile
	echo "\t@echo building dependency "\$@"" >> Makefile
	echo "\t\$(CXX) \$(CXXFLAGS) \$(INCLUDEFLAGS) -o \$@ -c \$<" >> Makefile
    echo "\n" >> Makefile

    echo "\$(BIN)/d_%.o: \$(SRC)/%\$(SRC_TYPE) \$(INC)/%\$(INC_TYPE)" >> Makefile
	echo "\t\$(CXX) \$(CXXFLAGS) \$(INCLUDEFLAGS) -g -o \$@ -c \$<" >> Makefile
    echo "\n" >> Makefile

    echo "run: all" >> Makefile
    echo "\tsource \$(SETUP_FILE) && ./\$(EXE)" >> Makefile
    echo "\n" >> Makefile

    echo "clean:" >> Makefile
	echo "\t@echo ========== cleaning up ===========" >> Makefile
    echo "\trm -f *~ \$(BIN)/*.o \$(EXE) \$(DEXE)" >> Makefile
    echo "\n" >> Makefile

    echo "begin:" >> Makefile
	echo "\t@echo ========== starting build ===========" >> Makefile
    echo "\n" >> Makefile



    cd ./src
    touch main.c
    echo "#include <stdio.h>" >> main.c
    echo "int main()" >> main.c
    echo "{" >> main.c
    echo "\tprintf(\"Hello, Graham!\");" >> main.c
    echo "\treturn 0;" >> main.c
    echo "}" >> main.c
    cd ..

    cd ./inc
    touch main.h
    cd ..

    ~/.vim/plugged/YCM-Generator/config_gen.py $PWD

    ctags -R -f ./.tags .
}


