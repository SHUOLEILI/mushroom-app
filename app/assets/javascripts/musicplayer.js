$(document).ready(function() {
    var audioSection = $('section#audio');
    $('a.html5').click(function() {

        var audio = $('<audio>', {
            controls : 'controls'
        });

        var url = $(this).attr('href');
        $('<source>').attr('src', url).appendTo(audio);
        audioSection.html(audio);
        return false;
    });
});

function showPlayer() {
    $('#mediadiv').show();
    $('#sheetdiv').hide();
    $('#profilediv').hide();
    $('#editProfilediv').hide()
}

function showSheet() {
    $('#mediadiv').hide();
    $('#sheetdiv').show();
    $('#profilediv').hide();
    $('#editProfilediv').hide()
}

function showProfile() {
    $('#mediadiv').hide();
    $('#sheetdiv').hide();
    $('#profilediv').show();
    $('#editProfilediv').hide()
}

function showEditProfile() {
    $('#mediadiv').hide();
    $('#sheetdiv').hide();
    $('#profilediv').hide();
    $('#editProfilediv').show()
}