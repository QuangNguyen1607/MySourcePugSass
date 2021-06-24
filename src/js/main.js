$(document).ready(function () {
	setBackgroundElement();
	// header
	mappingMenu();
	menuMobile();
	Acordition();
	// swiper
	swiperInit();
	pageBanner();
	scrollToDiv();
	selectDis();
});
/*==================== Append Click Scroll Tab ====================*/
function clickScrollTab() {
	$(".wrap-tab-link ul").scrollTo("li.active", 800);
	let numberTab = $(".tabslet-tab li").length;
	let countNumber = 1;
	if (numberTab > 2) {
		$(".tabslet-tab").wrap('<div class="number-tab-wrap"></div>');
		$(".number-tab-wrap").append(
			'<div class="icon-next"><div class="next"><em class="material-icons">navigate_next</em></div></div>'
		);
		$(".icon-next").click(function () {
			if (countNumber < numberTab - 1) {
				$(this)
					.parent()
					.find(".tabslet-tab")
					.scrollTo("li:eq(" + countNumber + ")", 800);
				countNumber++;
			} else {
				countNumber = 1;
				$(this).parent().find(".tabslet-tab").scrollTo("li:eq(0)", 800);
			}
		});
	}
}
/*==================== JS Other ====================*/
function height(el) {
	var height = 0;
	$(el).each(function () {
		var thisHeight = $(this).height();
		if (thisHeight > height) {
			height = thisHeight;
		}
		setTimeout(() => {
			$(el).height(height);
		}, 100);
	});
}

let header = {
	scrollActive: function () {
		let height = $("header").height();
		if ($(window).scrollTop() > height) {
			$("header").addClass("active");
		} else {
			$("header").removeClass("active");
		}
	},
};

function setBackgroundElement() {
	$("[setBackground]").each(function () {
		var background = $(this).attr("setBackground");
		var bgMobile = $(this).attr("setBackgroundMobile");
		var breakpoint = $(this).attr("breakpoint");
		if (typeof bgMobile != "undefined") {
			if ($(window).width() <= breakpoint) {
				$(this).css({
					"background-size": "cover",
					"background-position": "center center",
					"background-image": "url(" + bgMobile + ")",
				});
			} else {
				$(this).css({
					"background-size": "cover",
					"background-position": "center center",
					"background-image": "url(" + background + ")",
				});
			}
		} else {
			$(this).css({
				"background-size": "cover",
				"background-position": "center center",
				"background-image": "url(" + background + ")",
			});
		}
	});
	$("[setBackgroundRepeat]").each(function () {
		var background = $(this).attr("setBackgroundRepeat");
		$(this).css({
			"background-image": "url(" + background + ")",
			"background-repeat": "repeat",
		});
	});
	// if ($(window).width() < 376) {
	// 	$("[setBackgroundMobile]").each(function () {
	// 		var backgroundMobile = $(this).attr("setBackgroundMobile");
	// 		$(this).css({
	// 			"background-image": "url(" + backgroundMobile + ")",
	// 			"background-size": "cover",
	// 			"background-position": "center center",
	// 		});
	// 	});
	// }
}
function mappingMenu() {
	let mainMenu = $("header .bottom-wrap .menu-list").mapping({
		mobileWrapper: "header .mobile-wrap",
		mobileMethod: "appendTo",
		desktopWrapper: "header .bottom-wrap",
		desktopMethod: "appendTo",
		breakpoint: 768,
	});
	let mainMenuTop = $("header .top-wrap .menu-list").mapping({
		mobileWrapper: "header .mobile-wrap",
		mobileMethod: "appendTo",
		desktopWrapper: "header .top-wrap .main-menu-top",
		desktopMethod: "appendTo",
		breakpoint: 768,
	});
	let searchBox = $("header .top-wrap .searchbox").mapping({
		mobileWrapper: "header .mobile-wrap",
		mobileMethod: "appendTo",
		desktopWrapper: "header .top-wrap .main-search",
		desktopMethod: "appendTo",
		breakpoint: 576,
	});
}

function menuMobile() {
	let hamburger = $(".button-hambuger .burger-bt-inner");
	let menuMobile = $(".mobile-wrap");
	hamburger.on("click", function () {
		$(this).toggleClass("active");
		menuMobile.toggleClass("active");
	});
}

function swiperInit() {
	var bannerHome = new Swiper(".banner-home .swiper-container", {
		slidesPerView: 1,
		loop: true,
		autoplay: {
			delay: 5000,
		},
		speed: 300,
		// slidesPerColumn: 2,
		// spaceBetween: 30,
		slidesPerColumnFill: "row",
		pagination: {
			el: ".banner-home .swiper-pagination",
			clickable: true,
		},
		navigation: {
			nextEl: ".banner-home .button-next",
			prevEl: ".banner-home .button-prev",
		},
	});

	var home3Thumbs = new Swiper(
		".sabeco-home-3 .main-slide-thumbs .swiper-container",
		{
			slidesPerView: 3,
			speed: 300,
			slidesPerColumnFill: "row",
			freeMode: true,
			loopedSlides: 4,
			spaceBetween: 10,
			watchSlidesVisibility: true,
			watchSlidesProgress: true,
			breakpoints: {
				768: {
					spaceBetween: 30,
				},
			},
		}
	);

	var home3Top = new Swiper(
		".sabeco-home-3 .main-slide-top .swiper-container",
		{
			slidesPerView: 1,
			speed: 300,
			slidesPerColumnFill: "row",
			freeMode: true,
			loopedSlides: 4,
			thumbs: {
				swiper: home3Thumbs,
			},
			navigation: {
				nextEl: ".sabeco-home-3 .button-next",
				prevEl: ".sabeco-home-3 .button-prev",
			},
		}
	);

	var home5Slide = new Swiper(".sabeco-home-5 .swiper-container", {
		slidesPerView: 1,
		speed: 300,
		spaceBetween: 30,
		slidesPerColumnFill: "row",
		observer: true,
		observeParents: true,
		navigation: {
			nextEl: ".sabeco-home-5 .button-next",
			prevEl: ".sabeco-home-5 .button-prev",
		},
		breakpoints: {
			576: {
				spaceBetween: 30,
				slidesPerView: 2,
			},
			768: {
				spaceBetween: 40,
				slidesPerView: 3,
			},
		},
	});

	var slideStaff = new Swiper(".slide-Staff .swiper-container", {
		slidesPerView: 1.6,
		centeredSlides: true,
		spaceBetween: 0,
		speed: 1000,
		observer: true,
		loop: true,
		observeParents: true,
		navigation: {
			nextEl: ".slide-Staff .button-next",
			prevEl: ".slide-Staff .button-prev",
		},
		breakpoints: {
			460: {
				spaceBetween: 10,
				slidesPerView: 2,
				centeredSlides: false,
			},
			768: {
				spaceBetween: 10,
				slidesPerView: 3,
				centeredSlides: false,
			},
			1024: {
				spaceBetween: 100,
				slidesPerView: 4,
				centeredSlides: false,
			},
		},
	});

	var newsDetailRelated = new Swiper(
		".sabeco-newsroom-detail .news-related .swiper-container",
		{
			slidesPerView: 1,
			speed: 300,
			slidesPerColumnFill: "row",
			spaceBetween: 30,
			breakpoints: {
				576: {
					slidesPerView: 2,
				},
				768: {
					slidesPerView: 3,
				},
			},
			navigation: {
				nextEl: ".sabeco-newsroom-detail .news-related .button-next",
				prevEl: ".sabeco-newsroom-detail .news-related .button-prev",
			},
		}
	);
	var history_thum = new Swiper(".history-thumbs", {
		freeMode: true,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
		slidesPerView: 3,
		breakpoints: {
			576: {
				slidesPerView: 5,
			},
			768: {
				slidesPerView: 7,
			},
		},
		navigation: {
			nextEl: ".wrap-slide-thums .button-next",
			prevEl: ".wrap-slide-thums .button-prev",
		},
	});
	var history_top = new Swiper(".history-top", {
		spaceBetween: 10,

		thumbs: {
			swiper: history_thum,
		},
	});
}

function pageBanner() {
	var pageBanner = new Swiper(".pages-banner .swiper-container", {
		slidesPerView: 1,
		loop: true,
		autoplay: {
			delay: 3000,
		},
		lazy: true,
		parallax: true,
		speed: 300,
		effect: "fade",
	});
}

function scrollToDiv() {
	$(".pages-banner-arrow").on("click", function (event) {
		var hash = this.hash;
		$("html,body").animate(
			{
				scrollTop: $(".pages-banner").outerHeight(),
			},
			"slow"
		);
	});
}

function Acordition() {
	$(".faq-list .faq-item").click(function (e) {
		var t = $(this).closest(".faq-item").find(".content");
		$(this).closest(".faq-list").find(".content").not(t).slideUp();
		$(this).hasClass("active")
			? $(this).removeClass("active")
			: ($(this)
					.closest(".faq-list")
					.find(".faq-item.active")
					.removeClass("active"),
			  $(this).addClass("active")),
			t.stop(!1, !0).slideToggle(),
			e.preventDefault();
	});
}
$(document).on("scroll", function () {
	header.scrollActive();
});

const selectDis = () => {
	$(".select-item .title-select").click(function () {
		var t = $(this).closest(".select-item").find(".content");
		$(this).closest(".wrap-select").find(".content").not(this).slideUp();
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		} else {
			$(this)
				.closest(".wrap-select")
				.find(".title-select.active")
				.removeClass("active");
			$(this).addClass("active");
			t.stop(!1, !0).slideToggle(), e.preventDefault();
		}
	});
};
// const tabAcordition = () => {
// 	$(".list-faq .title").click(function (e) {
// 		var t = $(this).closest(".list-faq").find(".content");
// 		$(this).closest(".wrap-card ").find(".content").not(t).slideUp();
// 		$(this).hasClass("active")
// 			? $(this).removeClass("active")
// 			: ($(this)
// 					.closest(".wrap-card")
// 					.find(".title.active")
// 					.removeClass("active"),
// 			  $(this).addClass("active")),
// 			t.stop(!1, !0).slideToggle(),
// 			e.preventDefault();
// 	});
// };
