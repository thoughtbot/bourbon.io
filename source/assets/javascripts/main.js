const dropdownButton = document.querySelector('[data-js="dropdown"]');

if (dropdownButton) {
  dropdownButton.addEventListener('click', function() {
    let expanded = this.getAttribute('aria-expanded') === 'true' || false;
    this.setAttribute('aria-expanded', !expanded);
    let menu = this.nextElementSibling;
    menu.hidden = !menu.hidden;
  });
}
