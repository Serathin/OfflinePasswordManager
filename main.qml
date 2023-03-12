import QtQuick
import QtQuick.Controls

Window
{
    property Item currentItem: null

    id: wnd
    minimumWidth: 350
    minimumHeight: 180
    width: 640
    height: 480
    visible: true
    title: qsTr("Оффлайн менеджер паролей")

    Rectangle
    {
        id: rectangle
        anchors.fill: parent

        states:
        [
            State
            {
                name: "loginState"
            },
            State
            {
                name: "newAccountState"
            }
        ]
        state: "loginState"
        onStateChanged:
        {
            if (currentItem)
            {
                currentItem.destroy()
                currentItem = null
            }

            var comp
            var obj
            if (state === "loginState")
            {
                wnd.minimumWidth = 350
                wnd.minimumHeight = 180

                comp = Qt.createComponent("qrc:/OfflinePasswordManager/loginform.qml")
                obj = comp.createObject(rectangle)

                obj.newAccountClicked.connect(newAccountClicked)
            }
            else if (state === "newAccountState")
            {
                wnd.minimumWidth = 350
                wnd.minimumHeight = 180

                comp = Qt.createComponent("qrc:/OfflinePasswordManager/newaccountform.qml")
                obj = comp.createObject(rectangle)

                obj.backClicked.connect(loginClicked)
            }
            currentItem = obj
        }

        function loginClicked()
        {
            state = "loginState"
        }

        function newAccountClicked()
        {
            state = "newAccountState"
        }
    }
}
