/****************************************************************************
** Meta object code from reading C++ file 'global.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../global.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'global.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN6GlobalE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN6GlobalE = QtMocHelpers::stringData(
    "Global",
    "ReqId",
    "ID_GET_VARIFY_CODE",
    "ID_REG_USER",
    "ID_RESET_PWD",
    "ID_LOGIN_USER",
    "ID_CHAT_LOGIN",
    "ID_CHAT_LOGIN_RSP",
    "ID_SEARCH_USER_REQ",
    "ID_SEARCH_USER_RSP",
    "ID_ADD_FRIEND_REQ",
    "ID_ADD_FRIEND_RSP",
    "ID_NOTIFY_ADD_FRIEND_REQ",
    "ID_AUTH_FRIEND_REQ",
    "ID_AUTH_FRIEND_RSP",
    "ID_NOTIFY_AUTH_FRIEND_REQ",
    "ID_TEXT_CHAT_MSG_REQ",
    "ID_TEXT_CHAT_MSG_RSP",
    "ID_NOTIFY_TEXT_CHAT_MSG_REQ",
    "ErrorCodes",
    "SUCCESS",
    "ERR_JSON",
    "ERR_NETWORK",
    "Modules",
    "REGISTERMOD",
    "RESETMOD",
    "LOGINMOD",
    "DataType",
    "Text",
    "Image",
    "File"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN6GlobalE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       4,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, alias, flags, count, data
       1,    1, 0x0,   17,   34,
      19,   19, 0x0,    3,   68,
      23,   23, 0x0,    3,   74,
      27,   27, 0x0,    3,   80,

 // enum data: key, value
       2, uint(Global::ID_GET_VARIFY_CODE),
       3, uint(Global::ID_REG_USER),
       4, uint(Global::ID_RESET_PWD),
       5, uint(Global::ID_LOGIN_USER),
       6, uint(Global::ID_CHAT_LOGIN),
       7, uint(Global::ID_CHAT_LOGIN_RSP),
       8, uint(Global::ID_SEARCH_USER_REQ),
       9, uint(Global::ID_SEARCH_USER_RSP),
      10, uint(Global::ID_ADD_FRIEND_REQ),
      11, uint(Global::ID_ADD_FRIEND_RSP),
      12, uint(Global::ID_NOTIFY_ADD_FRIEND_REQ),
      13, uint(Global::ID_AUTH_FRIEND_REQ),
      14, uint(Global::ID_AUTH_FRIEND_RSP),
      15, uint(Global::ID_NOTIFY_AUTH_FRIEND_REQ),
      16, uint(Global::ID_TEXT_CHAT_MSG_REQ),
      17, uint(Global::ID_TEXT_CHAT_MSG_RSP),
      18, uint(Global::ID_NOTIFY_TEXT_CHAT_MSG_REQ),
      20, uint(Global::SUCCESS),
      21, uint(Global::ERR_JSON),
      22, uint(Global::ERR_NETWORK),
      24, uint(Global::REGISTERMOD),
      25, uint(Global::RESETMOD),
      26, uint(Global::LOGINMOD),
      28, uint(Global::Text),
      29, uint(Global::Image),
      30, uint(Global::File),

       0        // eod
};

Q_CONSTINIT const QMetaObject Global::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN6GlobalE.offsetsAndSizes,
    qt_meta_data_ZN6GlobalE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN6GlobalE_t,
        // enum 'ReqId'
        QtPrivate::TypeAndForceComplete<Global::ReqId, std::true_type>,
        // enum 'ErrorCodes'
        QtPrivate::TypeAndForceComplete<Global::ErrorCodes, std::true_type>,
        // enum 'Modules'
        QtPrivate::TypeAndForceComplete<Global::Modules, std::true_type>,
        // enum 'DataType'
        QtPrivate::TypeAndForceComplete<Global::DataType, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Global, std::true_type>
    >,
    nullptr
} };

void Global::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Global *>(_o);
    (void)_t;
    (void)_c;
    (void)_id;
    (void)_a;
}

const QMetaObject *Global::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Global::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN6GlobalE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Global::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    return _id;
}
QT_WARNING_POP
