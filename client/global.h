// Global.h
#ifndef GLOBAL_H
#define GLOBAL_H

#include <QObject>

/**
 * @brief 全局常量和枚举定义类
 *
 * 该类定义了整个应用程序中使用的全局常量、枚举和错误码
 * 继承自QObject以支持在QML中使用这些枚举值
 */
class Global : public QObject
{
    Q_OBJECT

public:
    /**
     * @brief 请求ID枚举
     * 用于标识不同类型的HTTP请求
     */
    enum ReqId{
        ID_GET_VARIFY_CODE = 1001, //获取验证码
        ID_REG_USER = 1002, //注册用户
        ID_RESET_PWD = 1003, //重置密码
        ID_LOGIN_USER = 1004, //用户登录
        ID_CHAT_LOGIN = 1005, //登陆聊天服务器
        ID_CHAT_LOGIN_RSP= 1006, //登陆聊天服务器回包
        ID_SEARCH_USER_REQ = 1007, //用户搜索请求
        ID_SEARCH_USER_RSP = 1008, //搜索用户回包
        ID_ADD_FRIEND_REQ = 1009,  //添加好友申请
        ID_ADD_FRIEND_RSP = 1010, //申请添加好友回复
        ID_NOTIFY_ADD_FRIEND_REQ = 1011,  //通知用户添加好友申请
        ID_AUTH_FRIEND_REQ = 1013,  //认证好友请求
        ID_AUTH_FRIEND_RSP = 1014,  //认证好友回复
        ID_NOTIFY_AUTH_FRIEND_REQ = 1015, //通知用户认证好友申请
        ID_TEXT_CHAT_MSG_REQ  = 1017,  //文本聊天信息请求
        ID_TEXT_CHAT_MSG_RSP  = 1018,  //文本聊天信息回复
        ID_NOTIFY_TEXT_CHAT_MSG_REQ = 1019, //通知用户文本聊天信息
    };
    Q_ENUM(ReqId) // 使枚举在QML中可用

    /**
     * @brief 错误码枚举
     * 定义了系统中可能出现的各种错误类型
     */
    enum ErrorCodes {
        SUCCESS = 0,     ///< 操作成功
        ERR_JSON = 1,    ///< JSON解析失败
        ERR_NETWORK = 2, ///< 网络错误
    };
    Q_ENUM(ErrorCodes) // 使枚举在QML中可用

    /**
     * @brief 模块枚举
     * 定义了系统中的不同功能模块
     */
    enum Modules {
        REGISTERMOD = 0, ///< 注册模块
        RESETMOD = 1,    ///< 重置密码模块
        LOGINMOD = 2,    ///< 登录模块
    };
    Q_ENUM(Modules) // 使枚举在QML中可用

    struct ServerInfo{
        QString Host;
        QString Port;
        QString Token;
        int Uid;
        ServerInfo(QString host, QString port, QString token, int uid) :
            Host(host), Port(port), Token(token), Uid(uid){}
        ServerInfo() = default;
    };


    enum DataType {
        Text = 0,
        Image = 1,
        File = 2
    };
    Q_ENUM(DataType)
};

#endif // GLOBAL_H
