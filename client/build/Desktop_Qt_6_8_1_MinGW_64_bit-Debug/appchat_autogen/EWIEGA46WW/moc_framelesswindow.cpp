/****************************************************************************
** Meta object code from reading C++ file 'framelesswindow.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../framelesswindow.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'framelesswindow.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN15FramelessWindowE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN15FramelessWindowE = QtMocHelpers::stringData(
    "FramelessWindow",
    "mouse_posChanged",
    "",
    "is_resizeChanged",
    "setWindowFlag",
    "is_top",
    "mouse_pos",
    "MousePosition",
    "is_resize",
    "TOPLEFT",
    "TOP",
    "TOPRIGHT",
    "LEFT",
    "RIGHT",
    "BOTTOMLEFT",
    "BOTTOM",
    "BOTTOMRIGHT",
    "NORMAL"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN15FramelessWindowE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       2,   37, // properties
       1,   47, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   32,    2, 0x06,    4 /* Public */,
       3,    0,   33,    2, 0x06,    5 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       4,    1,   34,    2, 0x02,    6 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Bool,    5,

 // properties: name, type, flags, notifyId, revision
       6, 0x80000000 | 7, 0x0001590b, uint(0), 0,
       8, QMetaType::Bool, 0x00015903, uint(1), 0,

 // enums: name, alias, flags, count, data
       7,    7, 0x0,    9,   52,

 // enum data: key, value
       9, uint(FramelessWindow::TOPLEFT),
      10, uint(FramelessWindow::TOP),
      11, uint(FramelessWindow::TOPRIGHT),
      12, uint(FramelessWindow::LEFT),
      13, uint(FramelessWindow::RIGHT),
      14, uint(FramelessWindow::BOTTOMLEFT),
      15, uint(FramelessWindow::BOTTOM),
      16, uint(FramelessWindow::BOTTOMRIGHT),
      17, uint(FramelessWindow::NORMAL),

       0        // eod
};

Q_CONSTINIT const QMetaObject FramelessWindow::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickWindow::staticMetaObject>(),
    qt_meta_stringdata_ZN15FramelessWindowE.offsetsAndSizes,
    qt_meta_data_ZN15FramelessWindowE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN15FramelessWindowE_t,
        // property 'mouse_pos'
        QtPrivate::TypeAndForceComplete<MousePosition, std::true_type>,
        // property 'is_resize'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // enum 'MousePosition'
        QtPrivate::TypeAndForceComplete<FramelessWindow::MousePosition, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<FramelessWindow, std::true_type>,
        // method 'mouse_posChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'is_resizeChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'setWindowFlag'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>
    >,
    nullptr
} };

void FramelessWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FramelessWindow *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->mouse_posChanged(); break;
        case 1: _t->is_resizeChanged(); break;
        case 2: _t->setWindowFlag((*reinterpret_cast< std::add_pointer_t<bool>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (FramelessWindow::*)();
            if (_q_method_type _q_method = &FramelessWindow::mouse_posChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (FramelessWindow::*)();
            if (_q_method_type _q_method = &FramelessWindow::is_resizeChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< MousePosition*>(_v) = _t->getMouse_pos(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->getIs_resize(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMouse_pos(*reinterpret_cast< MousePosition*>(_v)); break;
        case 1: _t->setIs_resize(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *FramelessWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FramelessWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN15FramelessWindowE.stringdata0))
        return static_cast<void*>(this);
    return QQuickWindow::qt_metacast(_clname);
}

int FramelessWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 3;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void FramelessWindow::mouse_posChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FramelessWindow::is_resizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
