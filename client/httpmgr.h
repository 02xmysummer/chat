#ifndef HTTPMGR_H
#define HTTPMGR_H
/******************************************************************************
 *
 * @file       httpmgr.h
 * @brief      http管理类
 *
 * @author     xuorz
 * @date       2025/04/16
 * @history
 *****************************************************************************/
#include "singleton.h"
#include <QString>
#include <QUrl>
#include <QObject>
#include <QNetworkAccessManager>
#include "global.h"
#include <memory>
#include <QJsonObject>
#include <QJsonDocument>
class HttpMgr:public QObject, public Singleton<HttpMgr>,
                public std::enable_shared_from_this<HttpMgr>
{
    Q_OBJECT
public:
    ~HttpMgr();
    void PostHttpReq(QUrl url,
                     QJsonObject json,
                     Global::ReqId req_id,
                     Global::Modules mod);
    Q_INVOKABLE void PostHttpReq(const QString &url,
                                 const QVariantMap &map,
                                 Global::ReqId req_id,
                                 Global::Modules mod);

    void slot_http_finish(Global::ReqId id,
                          QString res,
                          Global::ErrorCodes err,
                          Global::Modules mod);
private:
    friend class Singleton<HttpMgr>;
    HttpMgr();
    QNetworkAccessManager _manager;
signals:
    void sig_http_finish(Global::ReqId id, QString res, Global::ErrorCodes err, Global::Modules mod);
    void sig_reg_mod_finish(Global::ReqId id, QString res, Global::ErrorCodes err);
};

#endif // HTTPMGR_H
