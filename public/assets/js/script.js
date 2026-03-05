'use strict';

const elementToggleFunc = function (elem) { elem.classList.toggle('active'); };

const sidebar = document.querySelector('[data-sidebar]');
const sidebarBtn = document.querySelector('[data-sidebar-btn]');

if (sidebar && sidebarBtn) {
  sidebarBtn.addEventListener('click', function () { elementToggleFunc(sidebar); });
}

const navigationLinks = document.querySelectorAll('[data-nav-link]');
const pages = document.querySelectorAll('[data-page]');

for (let i = 0; i < navigationLinks.length; i++) {
  navigationLinks[i].addEventListener('click', function () {
    const targetPage = this.innerHTML.toLowerCase().trim();

    for (let j = 0; j < pages.length; j++) {
      const pageName = pages[j].dataset.page.toLowerCase().trim();
      if (targetPage === pageName) {
        pages[j].classList.add('active');
      } else {
        pages[j].classList.remove('active');
      }
    }

    for (let j = 0; j < navigationLinks.length; j++) {
      if (this === navigationLinks[j]) {
        navigationLinks[j].classList.add('active');
      } else {
        navigationLinks[j].classList.remove('active');
      }
    }

    window.scrollTo(0, 0);
  });
}
