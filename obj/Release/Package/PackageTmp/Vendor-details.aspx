<%@ Page Title="" Language="C#" MasterPageFile="~/CitySeva.Master" AutoEventWireup="true" CodeBehind="Vendor-details.aspx.cs" Inherits="CitySeva.dashboard.Vendor_details" %>

<asp:Content ID="content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        a:hover,
        a:focus {
            text-decoration: none;
            outline: none;
        }

        .demo {
            background-color: #F3F1F8;
        }

        .vertical-tab {
            font-family: 'Karla', sans-serif;
            display: table;
        }

            .vertical-tab .nav-tabs {
                display: table-cell;
                width: 25%;
                min-width: 25%;
                border: none;
                vertical-align: top;
            }

                .vertical-tab .nav-tabs li {
                    float: none;
                }

                    .vertical-tab .nav-tabs li a {
                        color: #555;
                        background: #fff;
                        font-size: 16px;
                        font-weight: 500;
                        letter-spacing: 0.5px;
                        text-transform: uppercase;
                        text-align: center;
                        padding: 8px 7px 7px;
                        margin: 0 10px 12px 0;
                        border-radius: 30px;
                        border: none;
                        box-shadow: 0 0 5px rgba(0,0,0,0.1);
                        overflow: hidden;
                        position: relative;
                        z-index: 1;
                        transition: all 0.5s ease 0s;
                    }

                        .vertical-tab .nav-tabs li a:hover,
                        .vertical-tab .nav-tabs li.active a,
                        .vertical-tab .nav-tabs li.active a:hover {
                            color: #fff;
                            background: #fff;
                            border: none;
                        }

                        .vertical-tab .nav-tabs li a:before {
                            content: '';
                            background-color: #B33771;
                            height: 7%;
                            width: 100%;
                            border-radius: 30px;
                            position: absolute;
                            left: 0;
                            bottom: 0;
                            z-index: -1;
                            transition: all 0.3s ease-out 0s;
                        }

                        .vertical-tab .nav-tabs li a:hover:before,
                        .vertical-tab .nav-tabs li.active a:before,
                        .vertical-tab .nav-tabs li.active a:hover:before {
                            height: 100%;
                        }

            .vertical-tab .tab-content {
                color: #777;
                background: #fff;
                font-size: 14px;
                font-weight: 500;
                line-height: 21px;
                padding: 15px;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                display: table-cell;
            }

                .vertical-tab .tab-content h3 {
                    color: #B33771;
                    font-size: 22px;
                    font-weight: 500;
                    text-transform: capitalize;
                    margin: 0 0 5px;
                }

        @media only screen and (max-width: 479px) {
            .vertical-tab .nav-tabs {
                width: 100%;
                display: block;
            }

                .vertical-tab .nav-tabs li a {
                    padding: 10px 25px 9px;
                    margin: 0 0 12px;
                }

            .vertical-tab .tab-content {
                font-size: 14px;
                padding: 15px;
                display: block;
            }
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="vertical-tab" role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#Section1" aria-controls="home" role="tab" data-toggle="tab">Section 1</a></li>
                        <li role="presentation"><a href="#Section2" aria-controls="profile" role="tab" data-toggle="tab">Section 2</a></li>
                        <li role="presentation"><a href="#Section3" aria-controls="messages" role="tab" data-toggle="tab">Section 3</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content tabs">
                        <div role="tabpanel" class="tab-pane fade in active" id="Section1">
                            <h3>Section 1</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section2">
                            <h3>Section 2</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="Section3">
                            <h3>Section 3</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper, magna a ultricies volutpat, mi eros viverra massa, vitae consequat nisi justo in tortor. Proin accumsan felis ac felis dapibus, non iaculis mi varius, mi eros viverra massa.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
