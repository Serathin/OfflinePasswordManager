import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

GridLayout
{
    signal backClicked()

    anchors.fill: parent
    columns: 3

    Item
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 3
    }

    Item
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.rowSpan: 4
    }

    TextField
    {
        id: loginField
        placeholderText: qsTr("Логин")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        Layout.preferredWidth: 300
        Layout.preferredHeight: 40
    }

    Item
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.rowSpan: 4
    }

    Item
    {
        Layout.preferredWidth: 300
        Layout.preferredHeight: 40
        TextField
        {
            id: passwordField
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            placeholderText: qsTr("Пароль")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            echoMode: TextInput.Password
        }
        ToolButton
        {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            contentItem: Text
            {
                text: qsTr("@")
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 12
                color: parent.pressed ? "darkgray" : (parent.hovered ? "gray" : "black")
            }
            width: height
            background: Rectangle
            {
                anchors.fill: parent
                color: "transparent"
            }
            onPressed: passwordField.echoMode = TextInput.Normal
            onReleased: passwordField.echoMode = TextInput.Password
        }
    }

    Button
    {
        text: qsTr("Создать аккаунт")
        font.pointSize: 12
        Layout.preferredWidth: 300
        Layout.preferredHeight: 40
    }

    ToolButton
    {
        contentItem: Text
        {
            text: qsTr("Назад")
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
            font.underline: true
            color: parent.pressed ? "darkred" : (parent.hovered ? "red" : "blue")
        }
        Layout.preferredWidth: 300
        Layout.preferredHeight: 40
        background: Rectangle
        {
            anchors.fill: parent
            color: "transparent"
        }
        onClicked: backClicked()
    }

    Item
    {
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.columnSpan: 3
    }
}
