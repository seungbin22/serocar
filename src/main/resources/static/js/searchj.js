function car_model_mini2(obj, cho) {
    mfrm = document.carlist_mini2;
    if (cho == '3') {
        mfrm.carinfo4.options.length = 1;
        jQuery.ajax({
            url: "/main.php?s=carmodel&t=ajax&carmode=" + 4 + "&carinfo1=" +
                encodeURIComponent(mfrm.carinfo1.value) + "&carinfo2=" +
                encodeURIComponent(mfrm.carinfo2.value) + "&carinfo3=" +
                encodeURIComponent(mfrm.carinfo3.value),
            success: carSuccess3
        });
        function carSuccess3(data) {
            if (data) {
                dt = data
                    .substring(0, data.length - 2)
                    .split('##');
                for (i = 0; i < dt.length; i++) {
                    dt2 = dt[i]
                        .substring(0, dt[i].length)
                        .split('@@');
                    mfrm
                        .carinfo4
                        .options[mfrm.carinfo4.options.length] = new Option(dt2[1], dt2[1]);
                }
            }
        }
    } else if (cho == '2') {
        mfrm.carinfo3.options.length = 1;
        mfrm.carinfo4.options.length = 1;
        jQuery.ajax({
            url: "/main.php?s=carmodel&t=ajax&carmode=" + 3 + "&carinfo1=" +
                encodeURIComponent(mfrm.carinfo1.value) + "&carinfo2=" +
                encodeURIComponent(mfrm.carinfo2.value),
            success: carSuccess2
        });
        function carSuccess2(data) {
            if (data) {
                dt = data
                    .substring(0, data.length - 2)
                    .split('##');
                for (i = 0; i < dt.length; i++) {
                    dt2 = dt[i]
                        .substring(0, dt[i].length)
                        .split('@@');
                    mfrm
                        .carinfo3
                        .options[mfrm.carinfo3.options.length] = new Option(dt2[1], dt2[1]);
                }
            }
        }
    } else if (cho == '1') {
        mfrm.carinfo2.options.length = 1;
        mfrm.carinfo3.options.length = 1;
        mfrm.carinfo4.options.length = 1;
        jQuery.ajax({
            url: "/main.php?s=carmodel&t=ajax&carmode=" + 2 + "&carinfo1=" +
                encodeURIComponent(mfrm.carinfo1.value) + "&carinfo2=" +
                encodeURIComponent(mfrm.carinfo2.value),
            success: carSuccess
        });
        function carSuccess(data) {
            if (data) {
                dt = data
                    .substring(0, data.length - 2)
                    .split('##');
                for (i = 0; i < dt.length; i++) {
                    dt2 = dt[i]
                        .substring(0, dt[i].length)
                        .split('@@');
                    mfrm
                        .carinfo2
                        .options[mfrm.carinfo2.options.length] = new Option(dt2[1], dt2[1]);
                }
            }
        }
    }
}

jQuery(document).ready(function () {

    var select = $("select.color");

    select.change(function () {
        var select_name = $(this)
            .children("option:selected")
            .text();
        $(this)
            .siblings("label")
            .text(select_name);
    });
});

function categoryChange(e) {
    //현대
    let hyundai = ["차종선택", "e-마이티", "e-에어로타운", "e-카운티", "EF쏘나타", "i30", "i30 PD", "i30cw", "i40", "ix35", "LF쏘나타", "LF쏘나타 뉴라이즈", "LF쏘나타 하이브리드", "쏘나타 하이브리드", "NF쏘나타", "NF쏘나타 트랜스폼", "YF쏘나타", "YF쏘나타 하이브리드", "갤로퍼", "갤로퍼∥", "그래드스타렉스", "그랜저", "그랜저 뉴 력셔리", "그랜저 HG", "그랜저HG 하이브리드", "그랜저IG", "그랜저IG 하이브리드", "그랜저TG", "그랜저XG", "그레이스", "그린시티", "글로벌900", "넥쏘", "뉴EF쏘나타", "뉴그랜저", "뉴그랜저XG", "뉴그레이스", "뉴다이너스티", "뉴베르나", "뉴슈퍼에에로시티", "뉴스타렉스", "뉴스타렉스 점보", "뉴아반떼XD", "뉴에쿠스", "뉴엑센트", "뉴카운티", "뉴클릭", "뉴투싼 ix", "뉴파워트럭", "뉴포터", "다이너스티", "대형(중형)트럭", "더 뉴 i40", "더 뉴 i30", "더 뉴그랜드스타렉스", "더 뉴그런저IG", "더 뉴그랜저IG 하이브리드", "더 뉴맥스크루즈", "더 뉴벨로스터", "더 뉴싼타페", "더 튜 싼타페 하이브리드", "더 뉴아반떼AD", "더 뉴아반떼MD", "더 뉴아이오닉", "더 뉴아이오닉 일렉트릭", "더 뉴아이오닉 플러그인", "더 뉴코나", "더 뉴코나 하이브리드", "더 뉴팰리세이드", "더 럭셔리 그랜저", "더 올뉴투싼", "더 올뉴투싼 하이브리드", "라비타", "리베로", "마르샤", "마이티", "마이티 II", "맥스크루즈", "메가트럭", "베뉴", "베라크루즈", "베르나", "베르나 트랜스폼", "벨로스터", "벨로스터 N", "벨로스터(JS)", "블루온", "산타모", "슈퍼(대형)트럭", "슈퍼에어로시티", "스쿠프", "스타렉스", "스타렉스 점보", "스타리아", "스텔라", "신형 i30", "신형 투스카니", "신형 투싼", "신형베르나", "싼타크루즈", "싼타페", "싼타페 더 프라임", "싼타페(CM)", "싼타페(DM)", "싼타페(TM)", "쏘나타", "쏘나타 II", "쏘나타 III", "쏘나타 더 브릴리언트", "쏘나타(DN8)", "쏘나타(DN8) 하이브리드", "쏠라티", "아반떼", "아반떼 N", "아반떼 쿠페", "아반떼 하이브리드", "아반떼 하이브리드(CN7)", "아반떼(CN7)", "아반떼AD", "아반떼HD", "아반떼MD", "아반떼XD", "아슬란", "아이오닉", "아이오닉 5", "아이오닉 6", "아이오닉 일렉트릭", "아이오닉 플러그인", "아토스", "에어로 버스", "에어로시티", "에어로타운", "에쿠스", "에쿠스(신형)", "엑센트", "엑센트 신형", "엑셀", "엑시언트 FCEV", "엘란트라", "올 뉴 아반떼", "올 뉴마이티", "올 뉴투싼", "유니버스", "유니시티", "일렉시티", "일렉시티 FCEV", "제네시스", "제네시스 쿠페", "제네시스 프라다", "제네시스DH", "카운티", "카운티 뉴브리즈", "카운티 일렉트릭", "캐스퍼", "코나", "코나 N", "코나 일렉트릭", "코나 하이브리드", "코러스", "클릭", "클릭 하이브리드", "테라칸", "투스카니", "투싼", "투싼 ix", "투싼ix FCEV", "트라고", "트라고 엑시언트", "트라고 엑시언트 프로", "트라제XG", "티뷰론", "티뷰론터뷸런스", "파비스", "팰리세이드", "포니", "포니II", "포터", "포터II", "포터II 일렉트릭", "프레스토"];
    //기아
    let kia = ["차종선택", "EV6", "K3", "K3 쿱", "K5", "K5 하이브리드", "K7", "K7 프레스티지", "K7 프리미어", "K7 프리미어 하이브리드", "K7 하이브리드", "K8", "K8 하이브리드", "K9(KH)", "그랜드카니발", "그랜버드", "그랜토", "뉴 신형 K5하이브리드", "뉴 신형K5", "뉴그랜버드", "뉴모닝", "뉴스포티지", "뉴쎄라토", "뉴쏘렌토", "뉴쏘렌토 R", "뉴엔터프라이즈", "뉴오피러스", "뉴카니발", "뉴카렌스", "뉴포텐샤", "니로", "니로 EV", "니로 플러스", "더 K9(RJ)", "더 뉴 K3", "더 뉴 기아 레이", "더 뉴K3", "더 뉴K3 쿱", "더 뉴K5", "더 뉴K7", "더 뉴K9(KH)", "더 뉴K9(RJ)", "더 뉴니로", "더 뉴레이", "더 뉴모닝", "더 뉴모하비", "더 뉴봉고Ⅲ화물", "더 뉴셀토스", "더 뉴스포티지R", "더 뉴쏘렌토", "더 뉴쏘울", "더 뉴카니발", "더 뉴카렌스", "더 뉴프라이드", "디 올뉴니로", "디 올뉴니로EV", "디 올뉴스포티지", "디 올뉴스포티지 하이브리드", "라이노", "레이", "레이 EV", "레토나", "레토나크루저", "로체", "로체 어드밴스", "로체 이노베이션", "록스타", "록스타 R2", "리오", "리오SF", "모닝", "모닝 어반", "모하비", "모하비 더 마스터", "베스타", "복사와이드", "봉고Ⅲ EV", "봉고Ⅲ 버스", "봉고Ⅲ 화물", "봉고프론티어", "비스토", "세레스", "세피아", "세피아2", "셀토스", "슈마", "스토닉", "스팅어", "스팅어 마이스터", "스펙트라", "스펙트라윙", "스포티지", "스포티지 R", "스포티지 더 볼드", "스포티지아멕스", "신형 K5", "신형 K5 하이브리드", "신형 스포티지", "신형 쏘렌토(MQ4)", "신형 카니발", "쎄라토", "쏘렌토", "쏘렌토 R", "쏘렌토 하이브리드", "쏘울", "쏘울 EV", "쏘울 부스터", "쏘울 부스터 EV", "아벨라", "엑스트랙", "엔터프라이즈", "엘란", "오피러스", "오피러스 프리미엄", "올 뉴K3", "올 뉴K7", "올 뉴K7 하이브리드", "올 뉴모닝", "올 뉴쏘렌토", "올 뉴쏘울", "올 뉴카니발", "올 뉴카렌스", "올 뉴프라이드", "올뉴모닝(JA)", "옵티마", "옵티마 리갈", "와이드봉고", "카니발", "카니발 R", "카니발2", "카렌스", "카렌스2", "카스타", "캐피탈", "코스모스", "콤비", "콩코드", "크레도스", "크레도스II", "타우너", "타이탄", "텔루라이드", "트레이드", "파멕스", "파워콤비", "포르테", "포르테 쿱", "포르테 하이브리드", "포텐샤", "프라이드", "프라이드(신형)", "프레지오"];
    //제네시스
    let genesis = ["차종선택", "G70", "G80", "G90", "GV60", "GV70", "GV80"];
    //쉐보레
    let chevrolet = ["차종선택", "G2X","넥시아","누비라","누비라2","뉴 라보","뉴 볼트 EV","뉴다마스","뉴라세티","뉴칼로스","뉴프린스","다마스","다마스2","더 넥스트 스파크","더 넥스트 이쿼녹스","더 뉴말리부"," 더 뉴스파크","더 뉴아베오","더 뉴카마로 SS"
    ,"더 뉴트랙스","라노스","라노스2","라보","라세티","라세티 프리미어","레간자", "레조","로얄 프린스","르망","리얼 뉴 콜로라도 ","마티즈","마티즈 크리에이티브","마티즈 클래식","마티즈2","말리부","매그너스","베리타스", "볼트","볼트 EUV","볼트 EV"];
    //르노
    let renault = ["차종선택","QM3","QM5","QM5 네오","QM6","SM3","SM3 Z.E","SM3 네오","SM3 뉴제네레이션","SM5","SM5 노바","SM6","SM7",
    "SM7 뉴아트","XM3","XM3 하이브리드","뉴 QM3","뉴 QM5","뉴 QM6","뉴 SM3","뉴 SM5 신형","뉴 SM5 임프레션","뉴 SM5 플래티넘","뉴 SM7","노바","뉴 마스터","뉴SM5","대형트럭","더 뉴QM6","더 뉴SM6","마스터","야무진","올 뉴 SM7","조에","캡쳐","클리오","트위지"];
    //쌍용
    let ssangYong = ["차종선택","G4 렉스턴","SY트럭", "뉴 로디우스","뉴 스타일 코란도 C","뉴 체어맨 W","뉴 코란도C","뉴 티볼리 에어",
    "뉴렉스턴","뉴무쏘", "뉴체어맨","뉴카이런","뉴코란도","더 뉴렉스턴 스포츠","더 뉴렉스턴 스포츠 칸","더 뉴코란도 스포츠","렉스턴",
    "렉스턴 스포츠","렉스턴 스포츠 칸","렉스턴2","렉스턴W","로디우스","로디우스 유로","무쏘","무쏘 스포츠","무쏘 신형","베리 뉴 티볼리",
    "슈퍼 렉스턴","신형 코란도","신형 코란도 투리스모","액티언","액티언 스포츠","올 뉴렉스턴","올 뉴코란도","이스타나","체어맨","체어맨 H",
    "체어맨 H 뉴클래식","체어맨 W","체어맨 W 카이저","카이런","코란도","코란도 스포츠","코란도 이모션","코란도 투리스모","코란도C","토레스","티볼리","티볼리 아머","티볼리 에어"];
    //BMW
    let bmw = ["차종선택","1M","1시리즈(1세대)","1시리즈(2세대)","1시리즈(3세대)","2시리즈(1세대)","2시리즈(2세대)","3시리즈(1세대)",
    "3시리즈(2세대)","3시리즈(3세대)","3시리즈(4세대)","3시리즈(5세대)","3시리즈(6세대)","3시리즈(7세대)","4시리즈(1세대)","4시리즈(2세대)","5시리즈(1세대)","5시리즈(2세대)","5시리즈(3세대)","5시리즈(4세대)","5시리즈(5세대)","5시리즈(6세대)","5시리즈(7세대)","6시리즈(1세대)","6시리즈(2세대)","6시리즈(3세대)","7시리즈(1세대)","7시리즈(2세대)","7시리즈(3세대)","7시리즈(4세대)","7시리즈(5세대)",
    "7시리즈(6세대)","8시리즈(2세대)","i3","i4","i7","i8","iX","iX3","M2"];
    //닛산
    let nissan = ["차종선택","180SX","200SX","240SX","280Z","280ZX","300ZX","350Z","370Z","GT-R","NV 밴","노트","듀알리스","라페스타",
    "로그","로렐","리버티","리프","리프(2세대)","마이크라","마치","맥시마","모코","무라노(1세대)","무라노(2세대)","무라노(3세대)","버사",
    "블루버드실피","세드릭","세레나","세피로","센트라","스카이라인(R32)","스카이라인(R33)","스카이라인(R34)","스카이라인(V35)"];
    //람보르기니
    let Lamborghini = ["차종선택","가야르도(1세대)","가야르도(2세대)","디아블로","레벤톤","무르시엘라고","베네노","아벤타도르","아스테리온","우라칸","우루스","쿤타치"];
    //랜드로버
    let land = ["차종선택","디스커버리","디스커버리 스포츠","디스커버리2","디스커버리3","디스커버리4","디스커버리5","디펜더","레인지로버 벨라","레인지로버 스포츠(1세대)","레인지로버 스포츠(2세대)","레인지로버 스포츠(3세대)","레인지로버 이보크","레인지로버 이보크(2세대)",
    "레인지로버(2세대)","레인지로버(3세대)","레인지로버(4세대)","레인지로버(5세대)","프리랜더","프리랜더2"];

    let target = document.getElementById("sb_class");
    let result;

    if (e.value == "현대") {
        result = hyundai;
    }
    if (e.value == "제네시스") {
        result = genesis;
    }
    if (e.value == "기아") {
        result = kia;
    }
    if (e.value == "쉐보레") {
        result = chevrolet;
    }
    if (e.value == "르노") {
        result = renault;
    }
    if (e.value == "쌍용") {
        result = ssangYong;
    }
    if (e.value == "BMW") {
        result = bmw;
    }if (e.value == "닛산") {
        result = nissan;
    }
    if (e.value == "람보르기니") {
        result = Lamborghini;
    }
    if (e.value == "랜드로버") {
        result = land;
    }
    
    target.options.length = 0;
    for (x in result) {
        let opt = document.createElement("option");
        opt.value = result[x];
        opt.innerHTML = result[x];
        target.appendChild(opt);
    }
}

function categoryChange2(e) {
    //현대
    let myTea = ["모델선택", "내장탑차", "사다리차", "음식물수거", "카캐리어"];
    let town = ["모델선택", "표준형", "장애인버스", "롱바디"];
    let county = ["모델선택", "21인승 롱바디", "특장차", "15인승 롱바디", "39인승 롱바디", "25인승 표준형", "16인승 롱바디", "캠핑카", "14인승 표준형", "34인승 표준형", "25인승 롱바디", "15인승 표준형", "리무진", "12인승 롱바디", "29인승 롱바디"];
    let ef = ["모델선택", "2.5 V6", "2.0 DOHC", "LPG", "1.8DOHC"];
    let i30 = ["모델선택", "2.0 VVT", "1.6 VVT", "1.6 VGT"];
    //제네시스
    let G70 = ["모델선택", "3.3T 스포츠 AWD", "2.2D", "3.3T 스포츠", "2.0T AWD", "수출형", "2.2D AWD", "2.0T"];
    let G80 = ["모델선택", "3.3 GDI", "3.8 GDI", "2.2D AWD", "수출형", "3.3 GDI AWD", "2.2D", "3.8 GDI AWD"];
    let G90 = ["모델선택", "5.0 AWD", "3.3T AWD", "3.8 AWD", "3.3T", "5.0 AWD 리무진", "3.8"]
    let GV60 = ["모델선택", , "ev AWD", "ev 2WD"];
    let GV70 = ["모델선택", "3.5T AWD", "2.2 디젤 AWD", "2.5T AWD", "2.2 디젤 2WD", "2.5T 2WD"];
    let GV80 = ["모델선택", "3.5 가솔린 2WD", "2.5 가솔린 AWD", "3.0 디젤 AWD", "2.5 가솔린 2WD", "3.5 가솔린 AWD", "3.0 디젤 2WD"];
    //기아
    let ev6 = ["모델선택", "스탠다드 2WD", "GT 4WD", "롱 레인지 4WD", "스탠다드 4WD", "롱 레인지 2WD"];
    let k3 = ["모델선택", "1.6 디젤", "유로 1.6 GDI", "1.6 GDI", "수출형"];
    let K3ko = ["모델선택", "1.6 터보 GDI", "1.6 GDI"];
    let k5 = ["모델선택", "LPI", "2.0 CVVT", "2.4 GDI", "2.0 CVVL", "수출형", "2.0 터보 GDI"];
    let k5hyi = ["모델선택", "디럭스", "500h 럭셔리", "수출형", "노블레스", "500h 노블레스", "럭셔리", "500h 프레스티지", "프레스티지"];
    let target = document.getElementById("sb_model");
    let result;
    //쉐보레
    let G2X = ["모델선택","2.0 터보"];
    let 넥시아 = ["모델선택","1.5"]; 
    let 누비라 = ["모델선택","5도어 2.0 DOHC","1.8 DOHC","스패건 1.8","5도어 1.5 SOHC","1.5 DOHC","스패건 1.5","5도어 1.5 DOHC"];
    let 누비라2 = ["모델선택","2.0","1.5","장애인"];
    let 뉴라보 = ["모델선택","접이식탑차","냉동탑차","캠핑카","보냉탑차","내장탑차","파워게이트","카고","롱카고","탑차"];
    let 뉴볼트EV = ["모델선택","ev"];
    //르노
    let QM3 = ["모델선택","RE","LE","SE"];
    let QM5 = ["모델선택","디젤 2WD","가솔린 2WD 씨티","디젤 4WD"];
    let QM5NEO = ["모델선택","디젤 2WD","가솔린 2WD 씨티","디젤 4WD"];
    let QM6 = ["모델선택","2.0 dCi 4WD","2.0 dCi 2WD","2.0 GDe 2WD"];
    //쌍용
    let G4렉스턴 = ["모델선택","2.2 4WD","2.2 2WD"];
    let SY = ["모델선택","18톤","렉카","유조차","12톤","기타","암롤","트랙터","20톤","분뇨차","청소차","17.5톤","덤프","윙바디","현금수송차","11.5톤","고소작업차","소방차","탱크로리","19톤","믹서","제설차","16톤","냉동차","압축진개차","트레일러","25톤","살수차",
    "콘테이너샤시"];
    let 뉴로디우스 = ["모델선택","11인승 4WD", "11인승 2WD","9인승 2WD"];
    let 뉴스타일코란도C = ["모델선택","2.2 AWD","2.2 2WD","언더리프트"];
    let 뉴체어맨W = ["모델선택","V8 5000","CW600 4TRONIC","CW700 4TRONIC","CW600","리무진","CW700"];
    //BMW
    let m1 = ["모델선택","1m 쿠페"];
    let s1 = ["모델선택","쿠페 116i","5도어 116i","쿠페 128i","컨버터블 135i","3도어 118i","쿠페 120d","컨버터블 128i","쿠페 135i"];
    let s2 = ["모델선택","쿠페 120d","5도어 118d","M140i","3도어 118i","5도어 120d"];
    let s3 = ["모델선택","120i","118d","M140i","M135i xDrive"];
    let s2시리즈1 = ["모델선택","쿠페 230i","쿠페 220d","쿠페 M240i","쿠페 228i","액티브 투어러","쿠페 M235i","쿠페 220i"];
    //닛산
    let sx180 = ["모델선택","2.0 쿠페","1.8 쿠페"];
    let sx200 = ["모델선택","1.8 쿠페","1.5 쿠페","2.0 쿠페"];
    let sx240 = ["모델선택","2.4 쿠페"];
    let z280 = ["모델선택","2.8 쿠페"];
    let zx280 = ["모델선택","2.8"];
    //람보르기니
    let 가야르도1세대 = ["모델선택","5.0 V10 슈퍼레제라","5.0 V10 쿠페","5.0 V10 스파이더"];
    let 가야르도2세대 = ["모델선택","LP560-4 스파이더","LP550-2 트리콜로레","LP550-2","LP570-4 슈퍼레제라","LP560-4 비콜로레","LP550-2 스파이더","LP570-4 스파이더 퍼포만테","LP570-4 슈퍼 트로페오 스트라달레","LP560-4","LP550-2 발렌티노 발보니","LP570-4 스쿠아드라 코르세"];   
    let 디아블로 = ["모델선택","6.0 VT SE","6.0 GT","5.7 SV","6.0 VT","5.7 로드스터","6.0 GTR","5.7 VT"];
    let 레벤톤 = ["모델선택","6.5 V12"];
    let 무르시엘라고 = ["모델선택","LP640 로드스터","6.2 V12 로드스터","LP640","LP670-4 슈퍼벨로체","6.2 V12 쿠페"];
    //랜드로버
    // let 디스커버리 
    
    //현대
    if (e.value == "e-마이티") {
        result = myTea;} else if (e.value == "e-에어로타운") {
        result = town;} else if (e.value == "e-카운티") {
        result = county;} else if (e.value == "EF쏘나타") {
        result = ef;} else if (e.value == "i30") {
        result = i30;
    }// 제네시스
    else if (e.value == "G70") { result = G70;} else if (e.value == "G80") {
        result = G80;} else if (e.value == "G90") {
        result = G90; } else if (e.value == "GV60") {
        result = GV60;} else if (e.value == "GV70") {
        result = GV70;} else if (e.value == "GV80") {
        result = GV80;
    }
    //기아
    else if (e.value == "EV6") {
        result = ev6;} else if (e.value == "K3") {
        result = k3;} else if (e.value == "K3 쿱") {
        result = K3ko;} else if (e.value == "K5") {
        result = k5;} else if (e.value == "K5 하이브리드") {
        result = k5hyi;
    }

    //쉐보레
    else if (e.value == "G2X") {
        result = G2X; }else if (e.value == "넥시아") {
        result = 넥시아; }else if (e.value == "누비라") {
        result = 누비라;}else if (e.value == "누비라2") {
        result = 누비라2;}else if (e.value == "뉴 라보") {
        result = 뉴라보;}else if (e.value == "뉴 볼트 EV") {
        result = 뉴볼트EV;
    }

    //르노
    else if (e.value == "QM3") {
        result = QM3;}else if (e.value == "QM5") {
        result = QM5;}else if (e.value == "QM5 네오") {
        result = QM5NEO;}else if (e.value == "QM6") {
        result = QM6;
    }

    //쌍용
    else if (e.value == "G4 렉스턴") {
        result = G4렉스턴;}else if (e.value == "SY트럭") {
        result = SY;}else if (e.value == "뉴 로디우스") {
        result = 뉴로디우스;}else if (e.value == "뉴 스타일 코란도 C") {
        result = 뉴스타일코란도C;}else if (e.value == "뉴 체어맨 W") {
        result = 뉴체어맨W;
    }
    
    //BMW
    else if (e.value == "1M") {
        result = m1;}else if (e.value == "1시리즈(1세대)") {
        result = s1;}else if (e.value == "1시리즈(2세대)") {
        result = s2;}else if (e.value == "1시리즈(3세대)") {
        result = s3;}else if (e.value == "2시리즈(1세대)") {
        result = s2시리즈1;
    }

    //닛산
    else if (e.value == "180SX") {
        result = sx180;}else if (e.value == "200SX") {
        result = sx200;}else if (e.value == "240SX") {
        result = sx240;}else if (e.value == "280Z") {
        result = z280;}else if (e.value == "280ZX") {
        result = zx280;
    }
    //람보르기니
    else if (e.value == "가야르도(1세대)") {
        result = 가야르도1세대;}else if (e.value == "가야르도(2세대)") {
        result = 가야르도2세대;}else if (e.value == "디아블로") {
        result = 디아블로;}else if (e.value == "레벤톤") {
        result = 레벤톤;}else if (e.value == "무르시엘라고") {
        result = 무르시엘라고;
    }
    //랜드로버
    
    
    
    
    target.options.length = 0;
    for (x in result) {
        let opt = document.createElement("option");
        opt.value = result[x];
        opt.innerHTML = result[x];
        target.appendChild(opt);
    }
}



window.onload = function () {
    "use strict";
    const el = document.querySelector(".el-checkbox-group");
    const label = el.querySelectorAll("label");

    label.forEach(v => {
        v.addEventListener("click", (e) => {
            label.forEach(v => {
                v.classList.remove("clicked");
            })
            v.classList.add("clicked");
        })
    })
}

// 검색 
//tabaction(".tabcont","img");
$(document).ready(function () {
    tabaction(".cate_tab ul", "txt");
    $("#cate_price li").each(function (index, item) {
        $(item).mouseenter(function () {
            $("#cate_price_car")
                .stop()
                .animate({
                    "left": (143 * index) + 41 + "px"
                }, 300);
        });
    });
    $("#cate_price").mouseenter(function () {
        $("#cate_price_car").css({ "opacity": "1.0" });
    });
    $("#cate_price").mouseleave(function () {
        $("#cate_price_car").css({ "opacity": "0.0" });
    });
});
function tabaction(tabname, type) {
    var tabname = tabname;
    $(tabname + ">li:eq(0)").attr({ "class": "on" });
    if (type == "img") {
        var tabimg1_src = $(tabname + ">li:eq(0) img:eq(0)");
        var tabimg1_alt = tabimg1_src
            .attr("src")
            .replace(".png", "http://xn--2n2bn02bojc.com/_on.png");
        tabimg1_src.attr({ "src": tabimg1_alt });
    }
    $(tabname + ">li>div:eq(0)").css({ "display": "block" });
    // var cont1height=$(tabname+">li>div:eq(0)").height()+50;
    // $(tabname).css({"height":cont1height+"px"});

    var tabarr = $.map($(tabname + ">li"), function (item, index) {
        $(".tabbtn", item).mouseenter(function () {
            // ========== 탭에 클래스 추가
            $(".tabbtn", tabname)
                .parent("li")
                .attr({ "class": "" });
            $(this)
                .parent("li")
                .attr({ "class": "on" });
            // $(item).attr({"class":"on"});\
            // ========== 이미지인경우
            if (type == "img") {
                // 초기화
                var tabimg_arr = $.map($(">li", tabname), function (imgitem, imgindex) {
                    var tabimg_src = $("img:eq(0)", imgitem);
                    var tabimg_alt = tabimg_src
                        .attr("src")
                        .replace("http://xn--2n2bn02bojc.com/_on.png", ".png");
                    tabimg_src.attr({ "src": tabimg_alt });
                });
                // 리플레이스
                var tabimg_src = $("img:eq(0)", item);
                var tabimg_alt = tabimg_src
                    .attr("src")
                    .replace(".png", "http://xn--2n2bn02bojc.com/_on.png");
                tabimg_src.attr({ "src": tabimg_alt });
            }
            // ========== 컨텐츠 제어
            $(tabname + ">li>div").css({ "display": "" });
            $("div", item).css({ "display": "flex" });
            // var contheight=$("div",item).height()+50;
            // $(tabname).css({"height":contheight+"px"});
        });
    });
}


// 작업
const item = document.querySelectorAll(".el-tabs__item");
const txtTab1 = document.querySelector(".txtTab1");
const txtTab2 = document.querySelector(".txtTab2");
const txtTab3 = document.querySelector(".txtTab3");
const label = document.querySelectorAll(".txtTab3 label");
const arr = [txtTab1, txtTab2, txtTab3];
const list = document.querySelectorAll(".el-input--suffix");
const popper = document.querySelectorAll(".el-popper");
const item2 = document.querySelectorAll(".el-select-dropdown__item");
const input = document.querySelectorAll(".el-input__inner");

cateList.forEach((v) => {
    v.addEventListener("click")
})

item2.forEach((v1, i1) => {
    v1.addEventListener("click", () => {
        for (let i = 0; i < input.length; i++) {
            let temp = v1
                .querySelector("span")
                .textContent;
            if (i == 1) {
                input[1].placeholder = temp;
            }
        }
        popper.forEach(v => {
            displayNone(v)
        });
    });
});
item2.forEach((v1, i1) => {
    v1.addEventListener("click", () => {
        for (let i = 0; i < input.length; i++) {
            let temp = v1
                .querySelector("span")
                .textContent;
            if (i == 2) {
                input[2].placeholder = temp;
            }
        }
        popper.forEach(v => {
            displayNone(v)
        });
    });
});

item2.forEach((v1, i1) => {
    v1.addEventListener("click", () => {
        for (let i = 0; i < input.length; i++) {
            let temp = v1
                .querySelector("span")
                .textContent;
            if (i == 7) {
                input[7].placeholder = temp;
            }
        }
        popper.forEach(v => {
            displayNone(v)
        });
    });
})

item2.forEach((v1, i1) => {
    v1.addEventListener("click", () => {
        for (let i = 0; i < input.length; i++) {
            let temp = v1
                .querySelector("span")
                .textContent;
            if (i == 8) {
                input[8].placeholder = temp;
            }
        }
        popper.forEach(v => {
            displayNone(v)
        });
    });
})

label.forEach(v => {
    v.addEventListener("click", () => {
        label.forEach(v => {
            v
                .classList
                .remove("selected-2");
        });
        v
            .classList
            .add("selected-2");
    });
});

let index = 0;

function displayNone(v) {
    v.style.display = "none";
}
function displayBlock(v) {
    popper[v - 1].style.display = "block";
}
function check(i) {
    if (i % 2 == 0) {
        popper.forEach(v => {
            v.style.display = "none";
        });
    }
    console.log(i)
}

for (let i = 0; i < list.length; i++) {
    list[i].addEventListener("click", () => {
        popper.forEach(v => {
            displayNone(v)
        });
        displayBlock(i);
    })
}

item.forEach((v, i) => {
    v.addEventListener("click", () => {
        for (let i = 0; i < item.length; i++) {
            item[i]
                .classList
                .remove("is-active");
            arr[i].style.display = "none";
        }

        arr[i].style.display = "block";
        v
            .classList
            .add("is-active");
    })
});