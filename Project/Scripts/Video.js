
$(function () {
    $("#beginning").button({
        text: false,
        icons: {
            primary: "ui-icon-seek-start"
        }
    });
    $("#rewind").button({
        text: false,
        icons: {
            primary: "ui-icon-seek-prev"
        }
    });
    $("#play").button({
        text: false,
        icons: {
            primary: "ui-icon-play"
        }
    })
		.click(function () {
		    var options;
		    if ($(this).text() === "play") {
		        options = {
		            label: "pause",
		            icons: {
		                primary: "ui-icon-pause"
		            }
		        };
		    } else {
		        options = {
		            label: "play",
		            icons: {
		                primary: "ui-icon-play"
		            }
		        };
		    }
		    $(this).button("option", options);
		});
    $("#stop").button({
        text: false,
        icons: {
            primary: "ui-icon-stop"
        }
    })
		.click(function () {
		    $("#play").button("option", {
		        label: "play",
		        icons: {
		            primary: "ui-icon-play"
		        }
		    });
		});
    $("#forward").button({
        text: false,
        icons: {
            primary: "ui-icon-seek-next"
        }
    });
    $("#end").button({
        text: false,
        icons: {
            primary: "ui-icon-seek-end"
        }
    });
    $("#shuffle").button();
    $("#repeat").buttonset();
});


//This is for when a user clicks on any of the buttons to play videos.


function tVideo(b) {

    switch (b.id) {
        case "beginning":
            break;
        case "rewind":
            break;
        case "play":
            break;
        case "stop":
            break;
        case "forward":
            break;
        case "end":
            break;
        default:

    }

// <!-- beginning , rewind , play , stop , forward, end -->




}
