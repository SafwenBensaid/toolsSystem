<%@page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper"%>
<%@page import="org.springframework.security.core.authority.mapping.SimpleAttributes2GrantedAuthoritiesMapper"%>
<%@page import="org.springframework.security.core.GrantedAuthority"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>

<br><br>
<div class='grandTitre'>
    Tickets MAINTENANCE en attente d'autorisation<br>
    par le Comit� Release pour int�grer la release en cours
</div>


<div id='conteneurAnimation'>
    <div id="loadingAnimationConteneur" class="center">
        <%@include file="/pages/loadingAnimation.jsp" %>
    </div>
    <div id='loadingAnimationConteneur1' class="center" style='display: none'>
        <%@include file='/pages/loadingAnimation1.jsp' %>
    </div>
</div>

<br><br><br>    

<div id="resultatHotfix">

</div>

<SCRIPT type="text/javascript" src="javascript/common.js"></SCRIPT>

<script>
    $(document).ready(function() {
        loadAllTicketsTable(true);
    });

    function loadAllTicketsTable(cyclique) {
        var contextPath = "<%=request.getContextPath()%>";
        $.ajax({
            type: "POST",
            url: contextPath + "/AutorisationDesTicketsMaintenanceServlet",
            data: "action=load",
            success: function(response) {
                $("#loadingAnimationConteneur").hide();
                $("#resultatHotfix").html(response);

                if (cyclique === true) {
                    setTimeout(function() {
                        loadAllTicketsTable(true);
                    }, 60000);
                }
            },
            error: function(e) {
                //alert('Error: ' + e);
            }
        });
    }

    function validerTickets() {
        var ticketsAuthorised = "";
        $("input:checked").each(function() {
            if ($(this).is(':checked')) {
                var id = $(this).closest("input").attr("id").trim();
                ticketsAuthorised += id;
            }
        });
        submitEtatTickets(ticketsAuthorised);
    }
    ;

    function submitEtatTickets(ticketsAuthorised) {
        var contextPath = "<%=request.getContextPath()%>";
        $("#loadingAnimationConteneur1").show();
        $.ajax({
            type: "POST",
            url: contextPath + "/AutorisationDesTicketsMaintenanceServlet",
            data: "action=submit&ticketsAuthorised=" + ticketsAuthorised,
            success: function(response) {
                $("#loadingAnimationConteneur1").hide();
                $("#messageResultatPersist").text(response);
                $("#messageResultatPersist").show();
                loadAllTicketsTable(false);
                setTimeout(function() {
                    $("#messageResultatPersist").hide();
                }, 3000);
            },
            error: function(e) {
                //alert('Error: ' + e);
                setTimeout(function() {
                    $("#messageResultatPersist").hide();
                }, 3000);
            }
        });
    }

    $(document).ready(function() {
        selectMenu('menuT24');
        $('#tableTicketsHotfix tr').hover(function() {
            $(this).addClass('hover');
        }, function() {
            $(this).removeClass('hover');
        });
    });


</script>


<style type="text/css">

    #tableTicketsHotfix tr:hover {
        background-color:#FAFAD2;
    }


    #conteneurAnimation{
        position:absolute;
        left: 300px;
        right: 0;
        margin: 0 auto;
        background-position: absolute; 
        z-index:1;
    }

    .conteneur_info_bull span{
        position:absolute;
        margin-top:22px;
        margin-left:-400px;
        color:#666666;
        background-color: white;
        max-width: 800px;
        white-space: pre;
        padding:10px;
        border-radius:2px;
        box-shadow:0 0 2px rgba(0,0,0,.5);
        transform:scale(0) rotate(-12deg);
        transition:all .25s;
        opacity:0;
    }
    /* quand le .info-icon est hover ou focus, son voisin span sera ... */  
    .info-icon:hover ~span, .info-icon:focus ~span{
        transform:scale(1) rotate(0); 
        opacity:1;
    }
    .info-icon{
        cursor: pointer;
        vertical-align: bottom;
        margin-left: 12px
    }

    input[type=checkbox].active_checkbox {
        position:absolute;
        z-index:-1000;
        overflow: hidden;
        clip: rect(0 0 0 0);
        height:2px;
        width:2px;
        margin:-2px;
        padding:0;
        border:0;
    }

    input[type=checkbox].active_checkbox + label.css-label {
        padding-left:40px;
        height:22px; 
        display:inline-block;
        line-height:22px;
        background-repeat:no-repeat;
        background-position: 0 0;
        font-size:22px;
        vertical-align:middle;
        cursor:pointer;
        margin-left: 40%;
    }

    input[type=checkbox].active_checkbox:checked + label.css-label {
        background-position: 0 -22px;
    }

    label.css-label {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .bout1{
        background-image:url(images/radio.png);
    }
    .bout2{
        background-image:url(images/switch_rejet.png);
    }
</style>