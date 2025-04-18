#ifndef SINGLETON_H
#define SINGLETON_H
/******************************************************************************
 *
 * @file       singleton.h
 * @brief      单例类
 *
 * @author     xuorz
 * @date       2025/04/16
 * @history
 *****************************************************************************/
#include <memory>
#include <mutex>
#include <iostream>
template <typename T>
class Singleton {
public:
    static std::shared_ptr<T> GetInstance(){
        std::once_flag s_flag;
        std::call_once(s_flag, [&](){
            _instance = std::shared_ptr<T>(new T);
        });
        return _instance;
    }
    void PrintAddress() {
        std::cout << _instance.get() << std::endl;
    }
    ~Singleton() {
        std::cout << "this is singleton destruct" << std::endl;
    }
protected:
    Singleton() = default;
    Singleton(const Singleton<T>&) = delete;
    Singleton& operator=(const Singleton<T>&) = delete;
    static std::shared_ptr<T> _instance;
};

template <typename T>
std::shared_ptr<T> Singleton<T>::_instance = nullptr;
#endif // SINGLETON_H
