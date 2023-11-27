﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adapter;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrub"] = "Product123";
                if (Session["Admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                getProducts();
            }
            lblMsg.Visible = false;
        }

        protected void btnAddorUpdate_Click(object sender, EventArgs e)
        {

            string actionName = String.Empty, imagePath = String.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int productId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_crud", con);
            cmd.Parameters.AddWithValue("@Action", productId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text.Trim());
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text.Trim());
            cmd.Parameters.AddWithValue("@CategoryId", ddlCategories.SelectedValue);
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
            if (fuProductImage.HasFile)
            {
                if (Utils.isValidToExtension(fuProductImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuProductImage.FileName);
                    imagePath = "Images/Product/" + obj.ToString() + fileExtension;
                    fuProductImage.PostedFile.SaveAs(Server.MapPath("~/Images/Product/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg or .png or .jpeg";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = false;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = productId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Product " + actionName + " Successfully!!!";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
                    Clear();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";

                }
                finally { con.Close(); }

            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please Enter valid Category Name And Image";
                lblMsg.CssClass = "alert alert-danger";
            }


        }

        private void getProducts()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Product_crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            adapter = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adapter.Fill(dt);
            rProduct.DataSource = dt;
            rProduct.DataBind();
        }

        private void Clear()
        {
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty; 
            txtPrice.Text = string.Empty;
            imgProduct.Visible = false;
            txtQuantity.Text = string.Empty;
            ddlCategories.SelectedValue = "0";
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddorUpdate.Text = "Add";
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "Edit")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                adapter = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adapter.Fill(dt);

                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtDescription.Text = dt.Rows[0]["Description"].ToString();
                txtPrice.Text = dt.Rows[0]["Price"].ToString();
                txtQuantity.Text = dt.Rows[0]["Quantity"].ToString();
                ddlCategories.SelectedValue = dt.Rows[0]["CategoryId"].ToString();

                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imgProduct.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.jpg" : "../" + dt.Rows[0]["ImageUrl"].ToString();

                imgProduct.Height = 200;
                imgProduct.Width = 200;
                hdnId.Value = dt.Rows[0]["ProductId"].ToString();
                btnAddorUpdate.Text = "Update";
                LinkButton linkButton = e.Item.FindControl("lnkEdit") as LinkButton;
                linkButton.CssClass = "badge bg-warning";


            }
            else if (e.CommandName == "Delete")
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category delete successfully";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Errore_" + ex.Message;
                    lblMsg.Text = "alert alert-danger";

                }
                finally
                {
                    cmd.Dispose();
                    con.Close();
                }
            }
        }

        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblIsActive") as Label;
                Label lblquantity = e.Item.FindControl("lblQuantity") as Label;
                if (lbl.Text == "True")
                {
                    lbl.Text = "Active";
                    lbl.CssClass = "badge badge-success";
                }
                else
                {
                    lbl.Text = "In-Active";
                    lbl.CssClass = "badge badge-danger";
                }

                if (Convert.ToInt32(lblquantity.Text) <= 5)
                {
                    lblquantity.CssClass = "badge badge-danger";
                    lblquantity.ToolTip = "Item about to be 'Out of stock'";
                
                }
            }
        }
    }
}