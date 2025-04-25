#ifndef TCPMGR_H
#define TCPMGR_H
#include <QTcpSocket>
#include "singleton.h"
#include "global.h"
#include "userdata.h"
class TcpMgr:public QObject, public Singleton<TcpMgr>,
               public std::enable_shared_from_this<TcpMgr>
{
    Q_OBJECT
public:
    TcpMgr(QObject *parent = nullptr);
private:
    void initHandlers();

    void handleMsg(Global::ReqId id, int len, QByteArray data);

    QTcpSocket _socket;
    QString _host;
    uint16_t _port;
    QByteArray _buffer;
    bool _b_recv_pending;
    quint16 _message_id;
    quint16 _message_len;
    QMap<Global::ReqId, std::function<void(Global::ReqId id, int len, QByteArray data)>> _handlers;

public slots:
    Q_INVOKABLE void slot_tcp_connect(const QString&);

    void slot_tcp_connect(Global::ServerInfo);

    void slot_send_data(Global::ReqId reqId, QString data);
signals:
    void sig_con_success(bool bsuccess);
    void sig_send_data(Global::ReqId reqId, QString data);
    void sig_swich_chatdlg();
    void sig_login_failed(int);
    void sig_user_search(QString);

};
#endif // TCPMGR_H
