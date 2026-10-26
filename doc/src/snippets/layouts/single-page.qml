// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 480
    height: 360
    minimumWidth: 320
    minimumHeight: 240
    visible: true
    title: qsTr("Single page")

    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width - 48, 360)
        spacing: 12

        Label {
            text: qsTr("Sign in")
            font.pixelSize: 24
        }
        TextField {
            Layout.fillWidth: true
            placeholderText: qsTr("User name")
        }
        TextField {
            Layout.fillWidth: true
            placeholderText: qsTr("Password")
            echoMode: TextInput.Password
        }
        Button {
            Layout.fillWidth: true
            text: qsTr("Continue")
            highlighted: true
        }
    }
}
