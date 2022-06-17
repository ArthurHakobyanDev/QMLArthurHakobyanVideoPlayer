import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Dialogs
import QtQuick.Controls
import QtMultimedia

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Arthur Hakobyan Video Player")

//Plays video after file is selected
    FileDialog{
        id: fileDialog
        onAccepted:{
        video.volume = 0
        video.play()
        }
    }
//Opens file dialog
    Button{
        text: "Select video file"
        onClicked: fileDialog.open()
    }
//Pause and play buttons set to respective icons
    Button{
        id: play
        x: 290
        y: 400
        width: 30
        height: 30
        icon.source: ":/../../Pictures/pauseButton.png"
        icon.width: 30
        icon.height: 30
        property int playState

//Pauses or resumes video based on video state. Also changes icons.
        onClicked:{
            if(video.playbackState == MediaPlayer.PlayingState)
            {
            play.playState = 1
            play.icon.source = ":/../../Pictures/playButton.png"
            video.pause()
            }
            else
            {
             play.playState = 0
             play.icon.source = ":/../../Pictures/pauseButton.png"
             video.play()
            }
        }
    }

    Slider {
        id: slider
        x: 120
        y: 440
        from: 0
        value: 0
        to: 100
        width: 400

//Adjusts video position to respective slider position when moved by the user

        onMoved:{
            video.position = video.duration * (slider.value)/100
        }
        onPressedChanged: {
            if(pressed)
            {
                video.pause()
            }
            else
            {
                if(play.playState == 0)
                {
                video.play()
                }
            }
        }

    }
//Sets video source to file selected
    Video {
        id: video
        y: 25
        width : 640
        height : 380
        source: fileDialog.currentFile
//Calls screenlock while video is playing. Disables screenlock when video has stopped. Check cpp files and .mm file for screenlock code.
        onPositionChanged:{
            slider.value = (video.position/video.duration) * 100
            /*
            lockscreen.callLock();
            if(video.playbackState == MediaPlayer.StoppedState)
            {
                lockscreen.callLock();
            }
            */

        }
    }




}
