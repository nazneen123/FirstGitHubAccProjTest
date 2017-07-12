public class ChartController {

    // Return a list of data points for a chart
    public List<Data> getData() {

        List<Data> data = new List<Data>();

        data.add(new Data('Draft', 12));

        data.add(new Data('Submitted', 16));

        data.add(new Data('Physical Verified', 20));

        data.add(new Data('Medical Verified', 15));

        data.add(new Data('Refree Verified', 5));
        return data;

    }

    // Wrapper class

    public class Data {
        public String name { get; set; }
        public Integer data1 { get; set; }
        //public Integer data2 { get; set; }
        //public Integer data3 { get; set; }

        public Data(String name, Integer data1) {
            this.name = name;
            this.data1 = data1;
          //  this.data2 = data2;
          //  this.data3 = data3;
        }
    }

}