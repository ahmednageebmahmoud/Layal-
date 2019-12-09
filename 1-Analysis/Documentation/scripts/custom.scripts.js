//Collapes

$('a').click((s)=>{
    window.location.hash=event.target.hash
    });
    

function activeUl(elmId, base) {
    if ($(`#${elmId}`).hasClass('activeUl'))
        $(`#${elmId}`).removeClass('activeUl');
    else {
        $(`.myCollapes`).not(`#${base}`).removeClass('activeUl');
        $(`#${elmId}`).addClass('activeUl');
    }
}

//Click On Target Tab
if (window.location.hash) {
    $(`[href="${window.location.hash}"]`).parent().parent().addClass('activeUl')
    document.querySelector(`[href="${window.location.hash}"]`).click();
}


//--------------------
//Replace Image
(function () {
    $('[updae-image]').on('mouseover', (e) => {
        if (!e.target.dataset.newImage)
            return;
        //Update Image
        $('#imageReview').attr('src', 'G:/Projects/MyProjects/Projects/2019/layal/1-Analysis/Documentation/images' + e.target.dataset.newImage);
    });
    //Update Image If Mouse Level
    $('[updae-image]').on('mouseout', (e) => {
        //reset Image
        if (!e.target.dataset.newImage)
            return;
        //Update Image
        $('#imageReview').attr('src', $('#imageReview').attr('data-base-src'));
    });
})();

function updateImage(src) {
    src ="G:/Projects/MyProjects/Projects/2019/layal/1-Analysis/Documentation" + src;
    $('#imageReview').attr('src', src)
        .attr('data-base-src', src);

}


