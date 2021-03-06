#--------------------------------------------------
# swipl-win.pro: SWI-Prolog / QT interface
#--------------------------------------------------
#
# REPL in QTextEdit on a background logic processor
#--------------------------------------------------
# Ing. Capelli Carlo - Brescia 2013

#-------------------------------------------------
# Project created by QtCreator 2013-07-10T10:26:52
#-------------------------------------------------

QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

macx {
    QT_CONFIG -= no-pkg-config
    CONFIG += c++11
    ICON = swipl.icns
    QMAKE_MACOS_DEPLOYMENT_TARGET = 10.6
}

TARGET = swipl-win
TEMPLATE = app

# please, not obsolete compiler
QMAKE_CXXFLAGS += -std=c++0x

# provide appropriate linking mode for
# static compilation of pqConsole source files
DEFINES += PQCONSOLE_STATIC

# remove old defines in foreign predicates params
# due to conflicting Qt5 template arguments
DEFINES += PL_SAFE_ARG_MACROS

# QPlainTextEdit vs QTextEdit : faster lightweight format
# TBD evaluate timing difference
DEFINES += PQCONSOLE_NO_HTML

# reactive interface
# TBD as above
# moved where the class is defined
# DEFINES += PQCONSOLE_BROWSER

# disable message hoovering and feedback, leave to reactive HTML
DEFINES += PQCONSOLE_HANDLE_HOOVERING

unix {
    # because SWI-Prolog is built from source
    CONFIG += link_pkgconfig
    PKGCONFIG += swipl
}

windows {
    SwiPl = "C:\Program Files\pl"
    INCLUDEPATH += $$SwiPl\include
    LIBS += -L$$SwiPl\bin -lswipl
}

mingw {
    SWIPL_BASE  = "../../"
    INCLUDEPATH += $$SWIPL_BASE/include ../cpp
    LIBS += -L$$SWIPL_BASE/lib/x64-win64 -lswipl
}

SOURCES += main.cpp \
    SwiPrologEngine.cpp \
    Swipl_IO.cpp \
    Preferences.cpp \
    pqMainWindow.cpp \
    pqConsole.cpp \
    FlushOutputEvents.cpp \
    ConsoleEdit.cpp \
    Completion.cpp \
    swipl_win.cpp \
    ParenMatching.cpp \
    reflexive.cpp \
    win_builtins.cpp \
    plMiniSyntax.cpp

RESOURCES += \
    swipl-win.qrc

OTHER_FILES += \
    README.md \
    MINGW.md

HEADERS += \
    SwiPrologEngine.h \
    Swipl_IO.h \
    Preferences.h \
    PREDICATE.h \
    pqMainWindow.h \
    pqConsole_global.h \
    pqConsole.h \
    FlushOutputEvents.h \
    do_events.h \
    ConsoleEdit.h \
    Completion.h \
    swipl_win.h \
    ParenMatching.h \
    plMiniSyntax.h
