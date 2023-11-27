using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using Foodies.Admin;

namespace Foodies
{
    public class Connection
    {
        public static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        }
    }

    public class Utils
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;
        public static bool isValidToExtension(string fileName)
        { 
        bool isValid = false;
        string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for (int i = 0; i <= fileName.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;

        }
        public static string GetImageUrl(object url)
        { 
         string url1 = string.Empty;
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "../Images/No_image.png";
            }
            else {
                url1 = string.Format("../{0}", url);
            }
            return url1;
        }

        public bool updateCartQuantity(int quantity, int productId, int userId)
        {
            bool isUpdate = false;
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                isUpdate = true;
            }
            catch (Exception ex)
            {
                isUpdate = false;
                System.Web.HttpContext.Current.Response.Write("<script>alert('Error - " + ex.Message + "');</script>");
            }
            finally { con.Close(); }
            return isUpdate;
        }
        public int cartCount(int userId)
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable(); 
            adapter.Fill(dt);
            return dt.Rows.Count;
        }
        public static string GetUniqueId()
        { 
          Guid guid = Guid.NewGuid();
          string uniqueId = guid.ToString();
          return uniqueId;
        }
    }

    public class DashboardCount
    { 
      SqlConnection con;
      SqlCommand cmd;
      SqlDataReader reader;

        public int Count(string tablename)
        { 
         int count = 0; 
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Dashboard", con);
            cmd.Parameters.AddWithValue("@Action", tablename);
            cmd.CommandType = CommandType.StoredProcedure;  
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["categoriesCount"] == DBNull.Value)
                {
                    count = 0;
                }
                else
                {
                    count = Convert.ToInt32(reader["categoriesCount"]);
                }

            }
            reader.Close();
            con.Close();
            return count;
        }
    }
}