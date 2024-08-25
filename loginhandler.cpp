#include "loginhandler.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QSslSocket>
#include <QUrl>
#include <QDebug>
LoginHandler::LoginHandler(QObject *parent) : QObject(parent)
{

}
void LoginHandler::login(const QString &username, const QString &password)
{
    m_networkManager = new QNetworkAccessManager(this);
    QUrl url("https://api-v3.octosniff.net/api/login");
    QNetworkRequest request(url);
    QJsonObject json;
    json["username"] = "sniper131388";
    json["password"] = "Pwd123!@#";

    QJsonDocument document(json);

    qDebug()<<document.toJson();
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    try {
        QNetworkReply* reply = m_networkManager->post(request, document.toJson());
        connect(reply, &QNetworkReply::finished, this, &LoginHandler::onReplyFinished);
        qDebug() << QSslSocket::supportsSsl() << QSslSocket::sslLibraryBuildVersionString() << QSslSocket::sslLibraryVersionString();
    } catch (const std::exception& e) {
        qDebug() << "Error: " << e.what();
    }

}

void LoginHandler::onReplyFinished()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
    if (reply->error() == QNetworkReply::NoError) {
        QByteArray response = reply->readAll();
        // Handle the response data here
        qDebug() << "Response:" << response;
    } else {
        // Handle the error
        qDebug() << "Error:" << reply->errorString();
    }

    reply->deleteLater();
}
