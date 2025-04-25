cmake_minimum_required(VERSION 3.16)

project(chat VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Network)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appchat
    main.cpp
)

qt_add_qml_module(appchat
    URI chat
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES FramelessWindow.qml

    RESOURCES rc.qrc
    SOURCES framelesswindow.h framelesswindow.cpp
    QML_FILES RoundImage.qml
    QML_FILES LoginPage.qml
    QML_FILES RegisterPage.qml
    QML_FILES XTextInput.qml
    QML_FILES ForgetPasswordPage.qml
    SOURCES singleton.h
    SOURCES httpmgr.h httpmgr.cpp
    QML_FILES MainWindow.qml
    SOURCES global.h
    SOURCES tcpmgr.h tcpmgr.cpp
    SOURCES usermgr.h usermgr.cpp
    QML_FILES LeftNavBar.qml
    QML_FILES CenterControlArea.qml
    QML_FILES ChatList.qml
    QML_FILES SearchArea.qml
    QML_FILES ChatItem.qml
    QML_FILES ChatArea.qml
    QML_FILES RightManagedZone.qml
    QML_FILES ChatTools.qml
    QML_FILES HoverImage.qml
    QML_FILES ChatInput.qml
    QML_FILES ChatContent.qml
    QML_FILES BubbleChatBox.qml
    QML_FILES SendFileDialog.qml
    QML_FILES ApplyFriendPage.qml
    QML_FILES UserList.qml
    QML_FILES UserItem.qml
    QML_FILES FriendAuthList.qml
    QML_FILES FriendAuthItem.qml
    QML_FILES SearchList.qml
    SOURCES userdata.h userdata.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appchat PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appchat
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appchat
    PRIVATE Qt6::Quick
        Qt6::Network
)

include(GNUInstallDirs)
install(TARGETS appchat
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
