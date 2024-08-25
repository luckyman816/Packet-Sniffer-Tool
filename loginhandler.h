#ifndef LOGINHANDLER_H
#define LOGINHANDLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
class LoginHandler : public QObject
{
    Q_OBJECT
public:
    explicit LoginHandler(QObject *parent = nullptr);
public slots:
    void login(const QString &username, const QString &password);
signals:
    void loginSuccess(const QString &token);
    void loginFailure();

private slots:
    void onReplyFinished();

private:
    QNetworkAccessManager *m_networkManager;
signals:

};

#endif // LOGINHANDLER_H
