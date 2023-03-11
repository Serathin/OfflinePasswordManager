import QtQuick

Window
{
    minimumWidth: 350
    minimumHeight: 150
    width: 640
    height: 480
    visible: true
    title: qsTr("Оффлайн менеджер паролей")

    Loader
    {
        anchors.fill: parent
        source: "qrc:/OfflinePasswordManager/loginform.qml"
    }
}
