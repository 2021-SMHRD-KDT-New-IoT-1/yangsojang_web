(function () {
  'use strict';

  var toggleLeftRightContainer = document.querySelector('.toggle--left-right');
  var toggleLeftRightCheckbox = document.querySelector('.toggle--left-right .toggle__checkbox');
  toggleLeftRightCheckbox.onclick = handleCheckboxClick;

  var toggleAnimations = document.querySelector('.animations-container .toggle__checkbox');
  toggleAnimations.onclick = handleTransitions;

  function handleCheckboxClick() {
    var cl = toggleLeftRightContainer.classList;
    cl.toggle('is-left-selected');
    cl.toggle('is-right-selected');
  }

  var cont = document.querySelector('.container');
  function handleTransitions() {
    cont.classList.toggle('no-animations');
  }
})();