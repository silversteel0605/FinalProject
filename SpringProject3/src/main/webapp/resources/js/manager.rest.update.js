$('#camp_update').click(function () {
	setData();
	updateCampingInfo();
});

function updateCampingInfo() {
	const data =  JSON.stringify({
		contentId : $('#contentId').val(),
		addr1 : addr1,
		addr2: addr2,
		doNm : sido,
		sigunguNm : sigungu,
		facltNm : siteNm,
		lineIntro : line
	})
	console.log(data);
	$.ajax({
	  url: `${Url}/manager/camp`,
	  type: "put",
	  dataType: "json",
	  data : data,
	  contentType : 'application/json;charset=UTF-8',
	  success : function(result) {
      	alert("업데이트 완료");
      	window.close();
      	opener.location.reload();
    },
    error: function(request, status, error) {
        console.log(request + "/" + status + "/" + error);
    }
  });
 }