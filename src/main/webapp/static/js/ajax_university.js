function setIdUniversity(id,idFaculty){
    var university = {};
    university["id"] = id;
    $.ajax({
        type : "GET",
        url : "/epss/getFacultyList",
        data : {id:id},
        timeout : 100000,
        success : function(data) {
            addInstitution(data,idFaculty);
            console.log("SUCCESS: ", university);
            console.log("SUCCESS: ", data);
        },
        error : function(e) {
            console.log("ERROR: log", e);

        },
        done : function(e) {
            console.log("DONE");
            enableSearchButton(true);
        }
    });
}


function addInstitution(data,idFaculty){//добавление элементов в select
    var institution = data;
    $("#"+idFaculty).empty();
    for(var i = 0 ; i<institution.length ; i++ ){
        $("#"+idFaculty).append("<option value ="+institution[i].id+">"+institution[i].abbreviation+"</option>");
    }
}