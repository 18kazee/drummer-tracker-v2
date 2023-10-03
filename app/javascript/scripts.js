/*!
* Start Bootstrap - Agency v7.0.4 (https://startbootstrap.com/theme/agency)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });


    
    document.addEventListener('turbo:load', () => {
      const applyPostEffects = (post) => {
        if (window.location.pathname.includes('/posts/')) {
          return;
        }

        post.addEventListener('mouseover', () => {
          post.style.cursor = 'pointer';
          post.classList.add('bg-light');
        });

        post.addEventListener('mouseout', () => {
          post.style.cursor = 'default';
          post.classList.remove('bg-light');
        });
      };

      const applyUserEffects = (user) => {
        user.addEventListener('mouseover', () => {
          user.style.cursor = 'pointer';
          user.style.opacity = '0.5';  // Add this line to change the opacity
        });

        user.addEventListener('mouseout', () => {
          user.style.cursor = 'default';
          user.style.opacity = '1';  // Add this line to reset the opacity
        });
      };

      const applyDrumerEffects = (drummer) => {
        drummer.addEventListener('mouseover', () => {
          drummer.style.cursor = 'pointer';
          drummer.style.opacity = '0.5';  // Add this line to change the opacity
        });
        drummer.addEventListener('mouseout', () => {
          drummer.style.cursor = 'default';
          drummer.style.opacity = '1';  // Add this line to reset the opacity
        });
      };

      document.querySelectorAll('[id^="post-"]').forEach(applyPostEffects);
      document.querySelectorAll('[id^="post-user-"]').forEach(applyUserEffects);
      document.querySelectorAll('[id^="post-drummer-"]').forEach(applyDrumerEffects);
    });


    document.addEventListener('turbo:load', function () {
      if (window.location.pathname.includes('/posts/')) {
        return;
      }

        document.querySelectorAll('.card').forEach(function(card) {
            card.addEventListener('click', function(e) {
                if (!e.target.closest('.link')) {
                    window.location.href = card.dataset.href;
                }
            });
        });
    });
});
