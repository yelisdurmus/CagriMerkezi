﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CagriMerkezi_ProsedurluLinq_
{
    public partial class Birim : Form
    {
        public Birim()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Birim_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            comboBox1.DataSource = baglanti.Subelers.ToList();
            comboBox1.DisplayMember = "ŞubeAdi";
            comboBox1.ValueMember = "ŞubeNo";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ad = textBox1.Text;
            string mudur = textBox2.Text;
            int sno = Convert.ToInt32(comboBox1.SelectedValue);
            baglanti.BirimEkle(ad, mudur, sno);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.BirimListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            baglanti.BirimSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["BirimAdi"].Value.ToString();
            textBox1.Tag = satir.Cells["BirimNo"].Value;
            textBox2.Text = satir.Cells["BirimMüdürü"].Value.ToString();
            comboBox1.Text = satir.Cells["ŞubeNo"].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Tag);
            string ad = textBox1.Text;
            string mudur = textBox2.Text;
            int sno = Convert.ToInt32(comboBox1.SelectedValue);
            baglanti.BirimYenile(id,ad, mudur, sno);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            goruntule();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                string ad = textBox1.Text;
                var listele1 = baglanti.BirimAdAra(ad);
                dataGridView1.DataSource = listele1.ToList();
            }
            if (checkBox2.Checked == true)
            {
                int durum = Convert.ToInt32(comboBox1.Text);
                var listele1 = baglanti.BirimŞubeNoAra(durum);
                dataGridView1.DataSource = listele1.ToList();
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form1 git = new Form1();
            git.Show();
            this.Hide();
        }
    }
}
