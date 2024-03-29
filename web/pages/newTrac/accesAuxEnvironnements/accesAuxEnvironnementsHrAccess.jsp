<br>
<div class='grandTitre' style="font-weight: bold;font-family:Verdana;">
    Accès aux environnements
</div>
<table id="tablePrincipaleEnv">
    <tr id="cadreActivationParCircuit">
        <td class="cadre" colspan="3">
            <div class="petitTitre">
            </div>
            <div class="divtab">
                <table class="envtab">
                    <thead>
                        <tr>
                            <th class="cadreThBlanc"><a href="http://172.28.70.74/trac/HR_ACCESS" target="_blank"> <img src="images/tracHrAccess.png" class="btnTrac1" style="margin: 0"/></a></th>
                            <th class="cadreTh caseGrandTitre">Circuit</th>
                            <th class="cadreTh caseGrandTitre" id="developpement">Développement</th>
                            <th class="cadreTh caseGrandTitre" id="developpement">Test</th>
                            <th class="cadreTh caseGrandTitre" id="packaging">Production</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="height:100px;width:160px;" class="caseGrandTitre">Développement Urgent</td>
                            <td style="background-color:#A7D1D9;" class="casePetitTitre">HOTFIX</td>
                            <td style="background-color:#A7D1D9"> <a href="http://172.28.70.55:8191/hra-space" class="myButton1" target="_blank" id="DEVH">DEVH</a></td>
                            <td style="background-color:#A7D1D9"> <a href="http://172.28.70.55:9090/hra-space" class="myButton1" target="_blank" id="INV">INV</a></td>
                            <td rowspan="3" style="background-image:linear-gradient(#A7D1D9, #E0D9BC);"> <a href="http://hr9app.biat.int:8181/hra-space/portal" class="myButton1" target="_blank" id="PROD">PROD</a></td>
                        </tr>
                        <tr>
                            <td rowspan="4" style="height:100px;" class="caseGrandTitre">Développement Planifié</td>
                            <td rowspan="2" style="background-color:#E0D9BC" class="casePetitTitre">RELEASE</td>
                            <td rowspan="2" style="background-color:#E0D9BC"> <a href="http://172.28.70.65:8181/hra-space" class="myButton1" target="_blank" id="DEVR">DEVR</a></td>
                            <td rowspan="2" style="background-color:#E0D9BC"> <a href="http://172.28.70.230:8181/hra-space" class="myButton1" target="_blank" id="RECETTE">RECETTE</a></td>
                        </tr>                    
                    </tbody>
                </table>
            </div>
        </td>
    </tr>    
</table>



<script>
    $(document).ready(function() {
        selectMenu('menuHRaccess');
    });
</script>