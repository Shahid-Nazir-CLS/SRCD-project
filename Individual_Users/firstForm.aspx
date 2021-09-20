<%@ Page Title="" Language="VB" MasterPageFile="~/Individual_Users/MasterPage.master" AutoEventWireup="false" CodeFile="firstForm.aspx.vb" Inherits="Individual_Users_Individual_Approval_Travel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="Signature/flashcanvas.js"></script>
    <script type="text/javascript" src="Signature/jSignature.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#signature").jSignature({ width: 450, height: 150, color: "#f00" });

        });
        function Reset() {
            var $sigdiv = $("#signature");
            //      $sigdiv.jSignature();
            $sigdiv.jSignature("reset")
        }
        function GetData() {
            var $sigdiv = $("#signature");
            var datapair = $sigdiv.jSignature("getData", "svgbase64")
            var image = document.getElementById("Image1");

            image.src = "data:" + datapair[0] + "," + datapair[1]
            var hiddenfield = $("#HiddenField1");
            hiddenfield.val("data:" + datapair[0] + "," + datapair[1]);

        }
    </script>

    <!--Amount in words-->
    <script>
        function convertNumberToWords(amount) {
            var words = new Array();
            words[0] = '';
            words[1] = 'One';
            words[2] = 'Two';
            words[3] = 'Three';
            words[4] = 'Four';
            words[5] = 'Five';
            words[6] = 'Six';
            words[7] = 'Seven';
            words[8] = 'Eight';
            words[9] = 'Nine';
            words[10] = 'Ten';
            words[11] = 'Eleven';
            words[12] = 'Twelve';
            words[13] = 'Thirteen';
            words[14] = 'Fourteen';
            words[15] = 'Fifteen';
            words[16] = 'Sixteen';
            words[17] = 'Seventeen';
            words[18] = 'Eighteen';
            words[19] = 'Nineteen';
            words[20] = 'Twenty';
            words[30] = 'Thirty';
            words[40] = 'Forty';
            words[50] = 'Fifty';
            words[60] = 'Sixty';
            words[70] = 'Seventy';
            words[80] = 'Eighty';
            words[90] = 'Ninety';
            amount = amount.toString();
            var atemp = amount.split(".");
            var number = atemp[0].split(",").join("");
            var n_length = number.length;
            var words_string = "";
            if (n_length <= 9) {
                var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
                var received_n_array = new Array();
                for (var i = 0; i < n_length; i++) {
                    received_n_array[i] = number.substr(i, 1);
                }
                for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
                    n_array[i] = received_n_array[j];
                }
                for (var i = 0, j = 1; i < 9; i++, j++) {
                    if (i == 0 || i == 2 || i == 4 || i == 7) {
                        if (n_array[i] == 1) {
                            n_array[j] = 10 + parseInt(n_array[j]);
                            n_array[i] = 0;
                        }
                    }
                }
                value = "";
                for (var i = 0; i < 9; i++) {
                    if (i == 0 || i == 2 || i == 4 || i == 7) {
                        value = n_array[i] * 10;
                    } else {
                        value = n_array[i];
                    }
                    if (value != 0) {
                        words_string += words[value] + " ";
                    }
                    if ((i == 1 && value != 0) || (i == 0 && value != 0 && n_array[i + 1] == 0)) {
                        words_string += "Crores ";
                    }
                    if ((i == 3 && value != 0) || (i == 2 && value != 0 && n_array[i + 1] == 0)) {
                        words_string += "Lakhs ";
                    }
                    if ((i == 5 && value != 0) || (i == 4 && value != 0 && n_array[i + 1] == 0)) {
                        words_string += "Thousand ";
                    }
                    if (i == 6 && value != 0 && (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
                        words_string += "Hundred and ";
                    } else if (i == 6 && value != 0) {
                        words_string += "Hundred ";
                    }
                }
                words_string = words_string.split("  ").join(" ");
            }
            return words_string;
        }
    </script>

    <style>
        .disable_button {
            height: 30px;
            width: 210px;
            font-weight: bold;
        }
         table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 20px 13px 20px 13px;
        }
    </style>



    <script>

        $(document).ready(function () {
            $("#signature").jSignature({
                'background-color': 'transparent',
                'decor-color': 'transparent',
            });
        });
    </script>

    <script type="text/javascript">
        function intOnly(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[^\d]+/g, '');
            }
        }
    </script>

    <script type="text/javascript">
        $('#clear').click(function () {
            $('#signature').jSignature("reset");
        });

    </script>

    <script type="text/javascript">
        function Replace_SpecialChars(i) {
            if (i.value.length > 0) {
                i.value = i.value.replace(/[#'^&"]/g, '');
            }
        }
    </script>

    <script type="text/javascript">

        function validateLimit(obj, divID, maxchar) {
            objDiv = get_object(divID);
            if (this.id) obj = this;
            var remaningChar = maxchar - obj.value.length;
            if (objDiv) {
                objDiv.innerHTML = remaningChar + " Characters Left";
            }
            if (remaningChar <= 0) {

                obj.value = obj.value.substring(maxchar, 0);

                if (objDiv) {
                    objDiv.innerHTML = "0 Characters Left";
                }
                return false;
            }
            else {
                return true;
            }
        }
        function get_object(id) {
            var object = null;
            if (document.layers) {
                object = document.layers[id];
            }
            else if (document.all) {
                object = document.all[id];
            }
            else if (document.getElementById) {
                object = document.getElementById(id);
            }
            return object;
        }
    </script>

    <style>
        textarea {
            resize: none;
        }

        .auto-style1 {
            color: #FF0000;
        }
    </style>

    <style>
        .txt {
            border: 1px solid black;
            padding: 4px;
            color: #333333;
            font-size: 14px;
            background-color: #ffffff;
        }

            .txt:hover {
                background-color: #fff4d8;
            }
    </style>
       



        <asp:Panel ID="Panel1" runat="server" Visible="true">

            <div style="text-align: center; margin-right: 25%; margin-left: 25%; font-size:18px">
        <div>
            <p style="font-weight: 600; font-size: 16px;">BIRLA INSTITUTE OF TECHNOLOGY AND SCIENCE PILANI, PILANI CAMPUS</p>
            <p style="font-weight: 800; font-size: 22px;">SPONSORED RESEARCH AND CONSULTANCY DIVISION</p>
            <div style="margin-top: 7%;">
                <p style="text-align: justify;">
                   <strong> CALL FOR RESEARCH STAFF POSITION (JRF/SRF/PROJECT ASSOCIATE-I/II) IN 
                    <input type="text"> (Name of Funding Agency) PROJECT</strong>
                </p>  
                <br />
                <div style="text-align: right;">
                    <strong>Date:</strong> <input type="text" name="" id="">
                </div> 
            </div>
        </div>
        
        <div style="margin-top: 7%;">
            <table  style="text-align: justify;">
                <tr>
                    <td colspan="2" >
                        <strong> About:</strong> Applications are invited from interested and motivated candidates for the post of <input type="text">.Junior Research Fellow (JRF)/Senior Research Fellow (SRF)/Research Associate (RA) etc. in a time bound research project for a temporary period purely on contractual basis as per the following details:
                    </td>
                </tr>
                <tr>
                    <td><strong>Position:</strong></td>
                    <td>Junior Research Fellow (JRF)/Senior Research Fellow (SRF)/Research Associate (RA)</td>
                </tr>
                <tr>
                    <td><strong>Number of Vacancy:</strong></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td><strong>Project Title:</strong></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td><strong>Principal Investigator:</strong></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td><strong>Project Tenure:</strong></td>
                    <td>3 years</td>
                </tr>
                <tr>
                    <td><strong>Job Description:</strong></td>
                    <td>JRF will carry out the <input type="text" name="" id="">.
                        He/she will also characterize the <input type="text" name="" id="">.
                        Additionally, he/she will examine the <input type="text" name="" id="">.
                        He/she will also compare the results with existing models and will propose new models based on findings. He/she will also write the research papers in indexed journals, conferences and patents.
                    </td>
                </tr>
                <tr>
                    <td><strong>Essential Qualification:</strong></td>
                    <td>First class Master's Degree in <input type="text" name="" id=""> from a recognized University or equivalent + GATE/NET/GPAT qualified.
                        (Those who are not GATE/NET/GPAT qualified shall be considered for the post lower than JRF as per DST norms)
                    </td>
                </tr>
                <tr>
                    <td><strong>Fellowship:</strong></td>
                    <td>(i)                  31,000/-(initially first two years) + Rs 35,000 (afterward till the end of the project).  + HRA to those who are           selected through (a) National Eligibility Tests - CSIR-UGC NET including lectureship (Assistant Professorship) or GATE or (b) A selection process through National level examinations conducted by Central Government Departments and their Agencies and Institutions.
                        (ii)                25,000/-(initially first two years) + Rs 28,000 (afterward till the end of the project).  + HRA to those who don't fall under category (i).</td>
                    </tr>
                    <tr>
                        <td><strong>Registration for PhD.:</strong></td>
                        <td>Selected candidates will be given the opportunity for a full time PhD program at BITS, Pilani as per the institute norms.</td>
                    </tr>
                </table> 
            </div>
                <br />
            <div style="text-align: left;">
                <p>
                    <strong>How to Apply :</strong>
                </p>
                <p style="text-align: justify;">
                    Applications along with updated CV should be sent through mail to abc@pilani.bits-pilani.ac.in. Shortlisted candidates will be informed for the interview. Mere possession of minimum qualification does not guarantee an invitation to the interview. Candidates will be shortlisted based on their merit and as per the requirement of the project. All candidates should make their own arrangements for their stay at Pilani, if required. No TA/DA will be paid for attending the interview.
                </p>
                <br />
                <br />
                <p>
                    <strong>Application Deadline:&nbsp;&nbsp;&nbsp;</strong><input type="text">
                </p>
                <br />
                <p>
                    <strong>Contact Email:&nbsp;&nbsp;&nbsp;</strong>abc@pilani.bits-pilani.ac.in
                </p>
                
            </div>
                <asp:Button ID="Button1" runat="server" Width="140px" Height="28px" Font-Bold="true" TabIndex="2" Text="Submit" />
                <input type="button" id="bWait" class="disable_button" value="Please wait ..." disabled="disabled" style="display: none;" />                                     
        </div>

        </asp:Panel>


    </div>
</asp:Content>

