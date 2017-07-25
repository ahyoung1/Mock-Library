$('#drawerMenu').drawer({ toggle: false });
$('#en').click(function () {
    var opts = { language: "en", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#ch').click(function () {
    var opts = { language: "ch", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#sp').click(function () {
    var opts = { language: "sp", pathPrefix: "/lang" };
    $("[data-localize]").localize("homepage", opts);
});
$('#main-slider').liquidSlider({
    autoSlide: true
});


function startIntro() {
    var intro = introJs();
    intro.setOptions({
        steps: [
          {
              intro: "Welcome to The Wonderland Library!"
          },
          {
              intro: "You can get <b>THE BEST BOOKS</b> here."
          },
          {
              element: document.querySelector('#navBar'),
              intro: "This is a navigation bar."
          },
          {
              element: document.querySelector('#login'),
              intro: "This is where you go to log in."
          },
          {
              element: document.querySelector('#register'),
              intro: "This is where you go to register."
          },
          {
              element: document.querySelector('#contact'),
              intro: "This is where you can go to send us a message."
          },
          {
              element: document.querySelector('#myBooks'),
              intro: "This is where you can view all the books you have checked out."
          },
          {
              element: document.querySelector('#patronInfo'),
              intro: "This is where you can view all your personal information."
          },
          {
              element: document.querySelector('#fullCatalog'),
              intro: "This is where you can view all of our books."
          },
          {
              element: document.querySelector('#main-slider'),
              intro: "Here are some of our featured books."
          }
          ,
          {
              intro: "Remember, you have to login or create an account before you can rent books!"
          }
        ]
    });
    intro.start();
}