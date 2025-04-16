import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

/******************************************************************************
 *
 * @file       LoginPage.qml
*               登录界面
 * @author     xuorz
 * @date       2025/03/13
 * @history
 *****************************************************************************/
Rectangle {
    id: loginPage
    width: 280
    height: 350
    color: "#f5f5f5"

    signal switchRegister()
    signal switchForgetPassword()
    signal login()

    Column {
        anchors.fill: parent
        spacing: 20
        anchors.margins: 30

        //头像
        RoundImage {
            width: 100
            height: width
            radius: width
            anchors.horizontalCenter:parent.horizontalCenter
            source: "qrc:/src/avatar.jpg"
        }
        //用户名
        XTextInput {
            id: emailInput
            hint: "请输入邮箱地址"
        }

        //密码
        XTextInput {
            id: passwordInput
            hint: "请输入密码"
            echoMode: TextInput.Password
        }
        //登录按钮
        Button {
            id: loginButton
            text: "登 录"
            width: parent.width - 40
            height: 35
            anchors.horizontalCenter: parent.horizontalCenter

            // 取消默认的按钮样式
            flat: true

            background: Rectangle {
                radius: 4
                border.width: 1
                border.color: "#198754"
                color: {
                    if (loginButton.hovered) return "#157347"    // 悬停时深绿
                    return "#198754"                             // 正常状态绿色
                }

                // Add MouseArea for cursor change
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onPressed: loginButton.pressed()
                    onReleased: loginButton.released()
                }
            }

            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
            }

            onClicked: {
                console.log("email : " ,emailInput.text)
                console.log("password : " ,passwordInput.text)
                login()
            }
        }

        // 添加注册和忘记密码的行
        Row {
            width: parent.width - 40
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Text {
                id: registerText
                text: "注册账号"
                color: registerArea.containsMouse ? "#666666" : "#999999"
                font.pixelSize: 14
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    id: registerArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("register")
                        loginPage.switchRegister()
                    }
                }
            }

            Item {
                width: parent.width - registerText.width - forgetText.width - parent.spacing * 2
                height: 1
            }

            Text {
                id: forgetText
                text: "忘记密码"
                color: forgetArea.containsMouse ? "#666666" : "#999999"
                font.pixelSize: 14
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    id: forgetArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("forgetpassword")

                        loginPage.switchForgetPassword()
                    }
                }
            }
        }
    }



}
