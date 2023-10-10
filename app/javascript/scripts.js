/*!
* Start Bootstrap - Agency v7.0.4 (https://startbootstrap.com/theme/agency)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
*/

//
// Scripts
// 

document.addEventListener('turbo:load', event => {

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

    // Initialize the Bootstrap navbar toggler
    var toggler = document.querySelector('.navbar-toggler');
    var navbar = document.querySelector('#navbarResponsive');

    if (toggler && navbar) {
        toggler.addEventListener('click', () => {
            navbar.classList.toggle('show');
        });
    }

    // Additional code to apply various effects
    const applyEffects = () => {
        const isPostsPage = window.location.pathname.includes('/posts/');

        const applyPostEffects = (post) => {
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
                user.style.opacity = '0.5';
            });

            user.addEventListener('mouseout', () => {
                user.style.cursor = 'default';
                user.style.opacity = '1';
            });
        };

        const applyDrummerEffects = (drummer) => {
            drummer.addEventListener('mouseover', () => {
                drummer.style.cursor = 'pointer';
                drummer.style.opacity = '0.5';
            });

            drummer.addEventListener('mouseout', () => {
                drummer.style.cursor = 'default';
                drummer.style.opacity = '1';
            });
        };

        const applyPostLikeEffects = (like) => {
            like.addEventListener('mouseover', () => {
                like.style.cursor = 'pointer';
                like.style.opacity = '0.5';
            });

            like.addEventListener('mouseout', () => {
                like.style.cursor = 'default';
                like.style.opacity = '1';
            });
        };

        if (!isPostsPage) {
            document.querySelectorAll('[id^="post-"]').forEach(applyPostEffects);

            document.querySelectorAll('.clickable-card').forEach(function(card) {
                card.addEventListener('click', function(e) {
                    if (e.target.closest('[id^="like-button-"]') || e.target.closest('.dropdown')) {
                      return;
                    }

                    if (!e.target.closest('.link')) {
                        window.location.href = card.dataset.href;
                    }
                });
            });
        }
        
        const observer = new MutationObserver(() => {
            applyEffects();
        });

        const config = { childList: true, subtree: true };

        const targetNode = document.getElementById('post');
        if (targetNode) {
            observer.observe(targetNode, config);
        }

        document.querySelectorAll('[id^="post-user-"]').forEach(applyUserEffects);
        document.querySelectorAll('[id^="post-drummer-"]').forEach(applyDrummerEffects);
        document.querySelectorAll('[id^="like-button-"]').forEach(applyPostLikeEffects);
    };

    applyEffects();
});
