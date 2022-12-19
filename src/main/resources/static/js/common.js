//control window resize trigger
$(window).resize(function () {
    if (this.resizeTO) {
        clearTimeout(this.resizeTO);
    }
    this.resizeTO = setTimeout(function () {
        $(this).trigger("resizeEnd");
    }, 0);
});

$(document).ready(function () {
    pcNav();
    scrollHd();
    modal();
    formEv();
});

//media query matches value
var mqWeb = window.matchMedia("screen and (min-width: 1200px)");
var mqPad = window.matchMedia("screen and (max-width: 991.98px)");
var mqMobile = window.matchMedia("screen and (max-width: 576.98px)");

//detect iphone
if (/iPhone/i.test(navigator.userAgent)) {
    $("html").addClass("iphone");
}

//scroll header
function scrollHd() {
    var windowST = $(window).scrollTop();
    var hd = $("header");
    var scrolledHd = $("#scrollHd");

    if (windowST > 0) {
        hd.not(scrolledHd).addClass("scroll");
    } else {
        hd.not(scrolledHd).removeClass("scroll");
    }

    $(window).scroll(function () {
        var windowSclST = $(window).scrollTop();
        if (windowSclST > 0) {
            hd.not(scrolledHd).addClass("scroll");
        } else {
            hd.not(scrolledHd).removeClass("scroll");
        }
    });
}

//pc navigation
function pcNav() {
    if (mqWeb.matches) {
        $("header").on("click", ".hd-search-btn__open", function (e) {
            e.preventDefault();

            $(e.target).hide();
            $(".hd-search-btn__enter").show();
            $(".hd-search-input").addClass("active");
            // $(".hd-search-input").find("input[type='text']").focus(); 0312 zoe 3차 주석 처리
        });
        $("header").on("click", ".hd-search-btn__close", "clicked", function (e) {
            e.preventDefault();

            $(".hd-search-btn__open").show();
            $(".hd-search-btn__enter").hide();
            $(".hd-search-input").removeClass("active");
        });
        $("header").on("click", ".hd-nav-menu__user", function (e) {
            e.preventDefault();

            $(".hd-mymenu-box").show();
        });
        $("header").on("click", ".hd-mymenu-btn__close", function (e) {
            e.preventDefault();

            $(".hd-mymenu-box").hide();
        });
        $(".hd-nav-menu__user").keydown(function (e) {
            var code = e.keyCode || e.which;

            if (code === 13) {
                $(".hd-mymenu-btn__close").focus();
            }
        });
        $("header").on("keydown", ".hd-search-input input", function () {
            $(".hd-search-recommend-list").show();

            if (!$(this).val()) {
                $(".hd-search-recommend-list").hide();
            }
        });
    }
}

//mobille navigation
if (window.matchMedia("screen and (max-width: 1199.98px)").matches) {
    var openMoNavBtn = $(".mo-nav-btn__open");
    var closeMoNavBtn = $(".mo-nav-btn__close");
    var scrolledHd = $("#scrollHd");

    $("header").on("click", ".mo-nav-btn__open", "clicked", function (e) {
        e.preventDefault();
        $("html").addClass("full");
        $(".mo-nav").addClass("scroll").slideDown(350);
    });
    $("header").on("click", ".mo-nav-btn__close", "clicked", function (e) {
        e.preventDefault();
        $("html").removeClass("full");
        $(".mo-nav").removeClass("scroll").slideUp(350);
    });
    $("header").on("click", ".mo-search-btn__open", "clicked", function (e) {
        e.preventDefault();
        if ($(window).scrollTop() == 0) {
            $("header").not(scrolledHd).toggleClass("scroll");
        }
        $(this).toggleClass("active");
        openMoNavBtn.toggle();
        $(".mo-search").toggle();
    });
    $("header").on("click", ".mo-nav-menu__user", "clicked", function (e) {
        e.preventDefault();
        $(e.target).find(".more-ico").toggleClass("active");
        $(".mo-mymenu-box").slideToggle(350);
    });
    $("header").on("keydown", ".mo-search-input input", function () {
        $(".mo-search-recommend-list").show();

        if (!$(this).val()) {
            $(".mo-search-recommend-list").hide();
        }
    });
}

//common modal
function modal() {
    var modalArea = $(".modal-area");
    var modalWrap = $("[class^=modal-wrap__]");
    var showModal = $(".show-modal-btn");
    var closeModal = $(".close-modal-btn");

    if (modalArea.is(":visible")) {
        $("body").addClass("full");
    } else {
        $("body").removeClass("full");
    }

    showModal.on("click", function (e) {
        e.preventDefault();
        $("body").addClass("full");
        modalArea.fadeIn(250);
    });

    closeModal.on("click", function (e) {
        e.preventDefault();
        $("body").removeClass("full");
        modalArea.fadeOut(250);
    });
    modalArea.on("click", function (e) {
        if (!$(e.target).closest(modalWrap).length) {
            $("body").removeClass("full");
            $(this).fadeOut(150);
        }
    });
}

//onclick modal
function clickModal(odj) {
    var thisModalData = $(odj).data("modal");
    var thisModal = $("#" + thisModalData);

    $("body").addClass("full");
    thisModal.fadeIn(250);
}

//notice modal (0521 zoe 추가)
function ntcModal() {
    var mainNtcModal = $("#mainNtcModal");
    if (mainNtcModal.length > 0) {
        $("body").addClass("full");
        mainNtcModal.show();
    }
}

//form
function formEv() {
    //form check
    $("input[type='checkbox']").on("keypress", function (e) {
        e.preventDefault(); //prevent scroll to top

        if (e.which === 13) {
            $(this).prop("checked", !$(this).prop("checked"));
        }
    });
    $("input[type='radio']").on("keypress", function (event) {
        if (event.which === 13) {
            $(this).prop("checked", !$(this).prop("checked"));
        }
    });

    //form textarea counter
    $(".keyup1000").on("keyup", function (e) {
        var content = $(this).val();
        var counter = $(this).next(".cmn-txtarea-counter");

        counter.html('<b class="fc-black count">' + content.length + "</b>/1000");

        if (content.length > 1000) {
            $(this).val(content.substring(0, 1000));
            counter.html('<b class="fc-black count">1000</b>/1000');
        }
    });

    //file upload
    $(".cmn-input-file")
        .find("input[type='file']")
        .change(function (e) {
            var fileName = e.target.files[0].name;
            $(this).parents().siblings(".cmn-input-txt").val(fileName);
        });
}

//post swiper
if ($("#postSwiper").length > 0) {
    var postSwiper = new Swiper("#postSwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
        speed: 750,
        loop: false,
        navigation: {
            nextEl: "#postSwiperNext",
            prevEl: "#postSwiperPrev",
        },
        breakpoints: {
            575.98: {
                slidesPerView: "auto",
                spaceBetween: 0,
                loop: true,
            },
        },
    });
}

//view swiper
if ($("#viewSwiper").length > 0) {
    var postSwiper = new Swiper("#viewSwiper", {
        slidesPerView: 1,
        speed: 750,
        loop: false,
        navigation: {
            nextEl: "#postSwiperNext",
            prevEl: "#postSwiperPrev",
        },
        breakpoints: {
            575.98: {
                slidesPerView: "auto",
                spaceBetween: 0,
                loop: true,
            },
        },
    });
}

function checkBirthday() {
    var birthday;
    var yy = $("#BirthYear option:selected").val();
    var mm = $("#BirthMonth option:selected").val();
    var dd = $("#BirthDays option:selected").val();

    var lang = "ko_KR";

    var oyy = $("#yy");
    var omm = $("#mm");
    var odd = $("#dd");

    if (yy == "" && mm == "" && dd == "") {
        //alert("태어난 년도를 선택하세요.");
        return false;
    }

    if (mm.length == 1) {
        mm = "0" + mm;
    }
    if (dd.length == 1) {
        dd = "0" + dd;
    }

    if (yy == "") {
        //alert("태어난 년도를 선택하세요.");
        return false;
    }
    if (yy.length != 4 || yy.indexOf("e") != -1 || yy.indexOf("E") != -1) {
        //alert("태어난 년도를 선택하세요.");
        return false;
    }
    if (mm == "") {
        //alert("태어난 월을 선택하세요.");
        return false;
    }
    if (dd == "") {
        //alert("태어난 일(날짜)를 선택하세요.");
        return false;
    }
    if (dd.length != 2 || dd.indexOf("e") != -1 || dd.indexOf("E") != -1) {
        //alert("태어난 일(날짜)를 선택하세요.");
        return false;
    }

    birthday = yy + mm + dd;
    if (!isValidDate(birthday)) {
        alert("생년월일을 다시 확인해주세요.");
        return false;
    }

    var age = calcAge(birthday);
    if (age < 0) {
        alert("미래에서 오셨군요. ^^");
        return false;
    } else if (age >= 100) {
        alert("정말이세요?");
        return false;
    } else if (age < 14) {
        alert("만 14세 미만의 어린이는 사용하실 수 없습니다.");
        return false;
    } else {
        return true;
    }
    return true;
}

function calcAge(birth) {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;
    var monthDay = month + "" + day;

    birth = birth.replace("-", "").replace("-", "");
    var birthdayy = birth.substr(0, 4);
    var birthdaymd = birth.substr(4, 4);

    var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
    return age;
}

function isValidDate(param) {
    try {
        param = param.replace(/-/g, "");

        // 자리수가 맞지않을때
        if (isNaN(param) || param.length != 8) {
            return false;
        }

        var year = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day = Number(param.substring(6, 8));

        if (month < 1 || month > 12) {
            return false;
        }

        var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        var maxDay = maxDaysInMonth[month - 1];

        // 윤년 체크
        if (month == 2 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)) {
            maxDay = 29;
        }

        if (day <= 0 || day > maxDay) {
            return false;
        }
        return true;
    } catch (err) {
        return false;
    }
}

function chkPW(pw) {
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/gi);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if (pw.length < 10 || pw.length > 16) {
        alert("비밀번호를 10자리 ~ 16자리 이내로 입력해주세요.");
        return false;
    } else if (pw.search(/\s/) != -1) {
        alert("비밀번호를 공백 없이 입력해주세요.");
        return false;
    } else if (
        (num < 0 && eng < 0) ||
        (eng < 0 && spe < 0) ||
        (spe < 0 && num < 0)
    ) {
        alert(
            "비밀번호를 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 입력해주세요."
        );
        return false;
    } else {
        return true;
    }
}

var RegNotNum = /[^0-9]/g;

function AutoDateYYYYMM(obj) {
    var date = obj.value;

    date = date.replace(RegNotNum, ""); // 숫자만 남기기

    if (date == "" || date == null || date.length < 5) {
        this.value = date;
        return;
    }

    var DataFormat;
    var RegPhonNum;

    // 날짜 포맷(yyyy-mm-dd) 만들기
    if (date.length <= 6) {
        DataFormat = "$1-$2"; // 포맷을 바꾸려면 이곳을 변경
        RegPhonNum = /([0-9]{4})([0-9]+)/;
    } else if (date.length <= 8) {
        DataFormat = "$1-$2-$3"; // 포맷을 바꾸려면 이곳을 변경
        RegPhonNum = /([0-9]{4})([0-9]{2})([0-9]+)/;
    }

    date = date.replace(RegPhonNum, DataFormat);

    obj.value = date;

    // 모두 입력됐을 경우 날짜 유효성 확인...
    if (date.length == 10) {
        var isVaild = true;

        if (isNaN(Date.parse(date))) {
            // 유효 날짜 확인 여부
            isVaild = false;
        } else {
            // 년, 월, 일 0 이상 여부 확인
            var date_sp = date.split("-");
            date_sp.forEach(function (sp) {
                if (parseInt(sp) == 0) {
                    isVaild = false;
                }
            });

            // 마지막 일 확인
            var last = new Date(
                new Date(date).getFullYear(),
                new Date(date).getMonth() + 1,
                0
            );
            // 일이 달의 마지막날을 초과했을 경우 다음달로 자동 전환되는 현상이 있음 (예-2월 30일 -> 3월 1일)
            if (parseInt(date_sp[1]) != last.getMonth() + 1) {
                var date_sp2 = date_sp.slice(0);
                date_sp2[2] = "01";
                var date2 = date_sp2.join("-");
                last = new Date(
                    new Date(date2).getFullYear(),
                    new Date(date2).getMonth() + 1,
                    0
                );
            }
            if (last.getDate() < parseInt(date_sp[2])) {
                isVaild = false;
            }
        }

        if (!isVaild) {
            alert("잘못된 날짜입니다. \n다시 입력하세요.");
            obj.value = "";
            obj.focus();
            return;
        }
    }
}