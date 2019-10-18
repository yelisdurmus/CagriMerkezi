using System;
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
    public partial class Odeme : Form
    {
        public Odeme()
        {
            InitializeComponent();
        }
        CagriMerkeziUygulamaDataContext baglanti = new CagriMerkeziUygulamaDataContext();
        private void Odeme_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
            comboBox1.DataSource = baglanti.Musterilers.ToList();
            comboBox1.ValueMember = "MusteriNo";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int mno = Convert.ToInt32(comboBox1.Text);
            string tip = comboBox2.Text;
            string tarih = dateTimePicker1.Text;
            decimal ucret= Convert.ToDecimal(textBox1.Text);
            int durum = Convert.ToInt32(numericUpDown1.Value);
            int faiz = Convert.ToInt32(textBox2.Text);
            baglanti.OdemeEkle(mno, tip, tarih, ucret, durum, faiz);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void goruntule()
        {
            var listele = baglanti.OdemeListele();
            baglanti.SubmitChanges();
            dataGridView1.DataSource = listele.ToList();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            comboBox1.Text = satir.Cells["MusteriNo"].Value.ToString();
            comboBox2.Text = satir.Cells["Tipi"].Value.ToString();
            dateTimePicker1.Text = satir.Cells["OdemeTarihi"].Value.ToString();
            textBox1.Text = satir.Cells["OdemeTutarı"].Value.ToString();
            textBox1.Tag = satir.Cells["OdemeNo"].Value;
            numericUpDown1.Text = satir.Cells["OdemeGeciktirmeDurumu"].Value.ToString();
            textBox2.Text = satir.Cells["OdemeGeciktirmeFaizi"].Value.ToString();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = (int)textBox1.Tag;
            baglanti.OdemeSil(id);
            baglanti.SubmitChanges();
            goruntule();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int ono = (int)textBox1.Tag;
            int mno = Convert.ToInt32(comboBox1.Text);
            string tip = comboBox2.Text;
            string tarih = dateTimePicker1.Text;
            decimal ucret = Convert.ToDecimal(textBox1.Text);
            int durum = Convert.ToInt32(numericUpDown1.Value);
            int faiz = Convert.ToInt32(textBox2.Text);
            baglanti.OdemeYenile(ono,mno, tip, tarih, ucret, durum, faiz);
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
                int mno = Convert.ToInt32(comboBox1.Text);
                var listele = baglanti.MNoGoreAra(mno);
                dataGridView1.DataSource = listele.ToList();
            }
            if (checkBox2.Checked == true)
            {
                string otipi = comboBox2.Text;
                var listele1 = baglanti.OtipiGoreAra(otipi);
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
