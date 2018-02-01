// JavaScript source code
$(document).ready(function () {
    var platform = "";
    $("input").click(function () {
        if ($("input[name=IoS]").is(":checked")) {
            platform = "ios";
        }
        else if ($("input[name=android]").is(":checked")) {
            platform = "android";
        }
        else if ($("input[name=cordova]").is(":checked")) {
            platform = "cordova";
        }
        else if ($("input[name=win]").is(":checked")) {
            platform = "win";
        }
        hideAndShow();

        $("input").attr("checked", false);
    });
    function hideAndShow() {
        switch (platform) {
            case "ios":
                $("#android_config").hide();
                $("#cordova_config").hide();
                $("#win_config").hide();
                $("#android_run").hide();
                $("#cordova_run").hide();
                $("#win_run").hide();
                $("#ios_config").show();
                $("#ios_run").show();
                break;
            case "android":
                $("#ios_config").hide();
                $("#cordova_config").hide();
                $("#win_config").hide();
                $("#ios_run").hide();
                $("#cordova_run").hide();
                $("#win_run").hide();
                $("#android_config").show();
                $("#android_run").show();
                break;
            case "cordova":
                $("#ios_config").hide();
                $("#android_config").hide();
                $("#win_config").hide();
                $("#ios_run").hide();
                $("#android_run").hide();
                $("#win_run").hide();
                $("#cordova_config").show();
                $("#cordova_run").show();
                break;
            case "win":
                $("#ios_config").hide();
                $("#android_config").hide();
                $("#cordova_config").hide();
                $("#ios_run").hide();
                $("#android_run").hide();
                $("#cordova_run").hide();
                $("#win_config").show();
                $("#win_run").show();
                break;
            default:
                $("#android_config").hide();
                $("#cordova_config").hide();
                $("#win_config").hide();
                $("#android_run").hide();
                $("#cordova_run").hide();
                $("#win_run").hide();
                $("#ios_config").show();
                $("#ios_run").show();
                break;

        }
    }
    $("#download").click(function () {
        var url;
        switch (platform)
        {
            case "ios":
                url = "https://www.oracle.com/webfolder/s/mobile-cloud-service/ios/16.4.5.0/mcs-ios-sdk-v16.4.5.0.zip";
                break;
            case "android":
                url = "https://www.oracle.com/webfolder/s/mobile-cloud-service/android/16.4.5.0/mcs-android-sdk-v16.4.5.0.zip";
                break;
            case "cordova":
                url = "https://www.oracle.com/webfolder/s/mobile-cloud-service/javascript/16.4.5.0/mcs-js-sdk-v16.4.5.0.zip";
                break;
            case "win":
                url = "https://www.oracle.com/webfolder/s/mobile-cloud-service/windows/16.2.3.1/mcs-windows-sdk-v16.2.3.1.zip";
                break;
            default:
                url = "https://www.oracle.com/webfolder/s/mobile-cloud-service/ios/16.4.5.0/mcs-ios-sdk-v16.4.5.0.zip";
                break;
        }
        $("#download").attr("href", url);
    });
    $("#backEnd").click(function () {
        if ($("#backEndName").attr("text", "")) {
            $("#alert").children[0].text("The name of the backend is required!");
        }
    });
    
})

