<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="QlyMain.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-size: 13px;
        }

        @media print {
            @page {
                size: 8.5in 5.5in;
                size: landscape;
            }

            body {
                font-size: 11px;
            }
        }

        table.table, td, th {
            border: 1px solid black;
        }

        table.table {
            width: 100%;
            border-collapse: collapse;
        }

        .fullHeight {
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table">
                <tr>
                    <th>Div./Section<br />
                        PE Division
                    </th>
                    <th>BÁO CÁO ĐỀ ÁN CẢI TIẾN
                        <br />
                        (IMPROVERMENT PROPOSAL)
                    </th>
                    <th>FG-7722 Ver.4.01
                        <br />
                        Page : 1/2
                    </th>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td colspan="2">
                        <table class="table">
                            <tr>
                                <th>Bộ Phận phát hành
                                        <br />
                                    (Proposal Div./Sec.:)</th>
                                <th>PE/APS</th>
                                <th>Bộ Phận/Vị trí áp dụng:
                                        <br />
                                    (Div./Sec./Location to apply)</th>
                                <th>SPGW ASSY</th>
                            </tr>
                            <tr>
                                <td>Item áp dụng :<br />
                                    (Item to be applied :)</td>
                                <td>BD Insight Item</td>
                                <td>Ý tưởng của (Tên/Code/Group):<br />
                                    (Idea by (Nam/code/Group):)
                                </td>
                                <td>Túc /2219/APS</td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="2">
                        <table class="fullHeight table">
                            <tr>
                                <th colspan="2">Phần phê duyệt hoàn thành cải tiến
                                                <br />
                                    (Completion approve)</th>
                            </tr>
                            <tr>
                                <td>Phê duyệt bởi<br />
                                    (Approve by)</td>
                                <td>Xác nhận bởi<br />
                                    (Confirmed by)</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="2">
                        <img src="Img/LeftArrow.png" alt="Alternate Text" width="10" height="30" /></td>
                    <td rowspan="2">
                        <table class="fullHeight table">
                            <tr>
                                <th colspan="2">Phê duyệt đề án 
                                                <br />
                                    (Proposal approve)</th>
                            </tr>
                            <tr>
                                <td>Phê duyệt bởi<br />
                                    (Approve by)</td>
                                <td>Phát hành bởi<br />
                                    (Confirmed by)</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="table">
                            <tr>
                                <td rowspan="3">Improvement to:</td>
                                <td>
                                    <asp:CheckBox runat="server" />
                                    Nhân công (Man-hour)
                                </td>
                                <td>
                                    <asp:CheckBox ID="cbMan_hour" runat="server" />Tăng tỷ suất lọi nhuận ,giảm lỗi(Yield radio)                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbCost_down" runat="server" />Giảm chi phí (Cost-down)
                                </td>
                                <td>
                                    <asp:CheckBox ID="cbSpace" runat="server" />Không gian ,diện tích (Space)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbProductivity" runat="server" />Năng suất (Productivity)
                                </td>
                                <td>
                                    <asp:CheckBox ID="cb5S" runat="server" />5S
                                </td>
                                <td>
                                    <asp:CheckBox ID="cbSafety" runat="server" />An toàn (Safety)
                                </td>
                            </tr>
                            <tr></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <th>Tiêu đề cải tiến
                                    <br />
                        (Improvement title)</th>
                    <th>Combine daily report at plasma top process with grinding top process of SPGW ASSY</th>

                    <th>Số quản lý
                                    <br />
                        (Control no.)</th>
                    <th>IMP-R.....</th>
                </tr>
            </table>
            <table class="table">
                <tr>
                    <th rowspan="3" class="textV">Maint
                        <br />
                        improvement
                        <br />
                        contents</th>
                </tr>
                <tr>
                    <td>Trước cải tiến (Trình bày bằng lời, hình ảnh, sơ đồ,...)
                                    <br />
                        Before improvement (Present in words,picture,diagrams,etc)
                    </td>
                    <td rowspan="2">
                        <img src="Img/rightArrow.png" alt="Alternate Text" width="20" height="40" /></td>
                    <td>Cải tiến mong muốn (Trình bày bằng lời, hình ảnh, sơ đồ,...)
                                    <br />
                        Expected improvement (Present in words,picture,diagrams,etc)
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="Img/s1.png" alt="Alternate Text" height="150" /></td>
                    <td>
                        <img src="Img/s2.png" alt="Alternate Text" height="150" /></td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td>Số biên bản họp (Meeting minute no):...None</td>
                    <td>ECR No : ECR...None</td>
                    <td>Lý do nếu không ban hành ECR (Reason if not issuing ECR):</td>
                </tr>
                <tr>
                    <td>Số tài liệu liên quan(Related document no):.....None</td>
                    <td>FMEA No:PE-R....None</td>
                    <td>Không ảnh hưởng đến chất lượng sản phẩm</td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>Chi phí ước tính :None
                                        <br />
                                    (Estimated Cost :)</td>
                                <td>Ngày áp dụng dự kiến :Oct.20
                                        <br />
                                    (Application date plan:)</td>
                            </tr>
                        </table>
                        <table class="table">
                            <tr>
                                <td rowspan="4">Hiệu quả ước tính :
                                        <br />
                                    (Estimated Effectiveness:)</td>
                            </tr>
                            <tr>
                                <td>Sau cải tiến:0.86h/month
                                        <br />
                                    (After improvement:)</td>
                            </tr>
                            <tr>
                                <td>Giá trị giảm được dự kiến :0.86h/month
                                        <br />
                                    (Expected reduce value :)</td>
                            </tr>
                            <tr>
                                <td>Chi phí sẽ giảm(USD/năm):21.1 USD/YEAR
                                        <br />
                                    (Costdown value (USD/Year:))</td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        <table class="table">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td colspan="2">Chi phí thực tế :
                                        <br />
                                                (Actual Cost:)</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Ngày áp dụng thực tế :
                                        <br />
                                                (Actual application date:)</td>
                                        </tr>
                                        <tr>
                                            <td rowspan="4">Hiệu quả thu được sau khi
                                        <br />
                                                Áp dụng cải tiến
                                        <br />
                                                (Effectiveness after finishing<br />
                                                improvement)</td>
                                        </tr>
                                        <tr>
                                            <td>Sau cải tiến :<br />
                                                (After improvement :)</td>
                                        </tr>
                                        <tr>
                                            <td>Giá trị giảm được thực tế :<br />
                                                (Actual reduce value :)</td>
                                        </tr>
                                        <tr>
                                            <td>Chi phí sẽ giảm (USD/Năm):<br />
                                                (Costdown value (USD/Year))</td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="text-align: center">
                                    <img src="Img/LeftArrow.png" alt="Alternate Text" width="20" height="40" /></td>
                                <td>Manager xác nhận thông tin bên trái
                                        <br />
                                    trước khi ký approve<br />
                                    (Managers need confirm the information on the left before
                                        <br />
                                    signing/stamping for approval)
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td>
                        <img src="#" alt="Alternate Text" width="100" height="20" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td>*Can use this form by both electronic and hard copy.</td>
                    <td>Liên lạc với nhóm APS để lấy Số quản lý.</td>
                    <td>Control no format :IMP-Ryymmnnn</td>
                </tr>
                <tr>
                    <td>*Check and compare the version ,effective date before print out</td>
                    <td>(Contact the APS team for take Control no)</td>
                    <td>Example : IMP-R1808001</td>
                </tr>
            </table>
        </div>
        <div>
            <table class="table">
                <tr>
                    <td>ASAHI INTECC HANOI CO.,LDT</td>
                    <td>Related document : AV-0029 ,AVPE-2921,AVPE-5663</td>
                    <td>Keep period:10 years</td>
                    <td>Effective date:01.Jul.2020</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
