
$(function () {

  function fadeMain() {
    $('.main').addClass('is-faded');
  }

  function unfadeMain() {
    $('.main').removeClass('is-faded');
  }

  function openSettings(e) {
    e.stopPropagation();
    fadeMain();
    $('.js-settings').addClass('is-open');
    $('.main').on('click', function () {
      closeSettings()
    });
  }

  function closeSettings() {
    unfadeMain();
    $('.js-settings').removeClass('is-open');
    $('.main').off('click');
  }

  function isSettingsOpen() {
    return $('.js-settings').hasClass('is-open');
  }

  $('.js-settings-toggle').click(function (e) {
    if (isSettingsOpen()) {
      closeSettings(e);
    } else {
      openSettings(e);
    }
  });
});

