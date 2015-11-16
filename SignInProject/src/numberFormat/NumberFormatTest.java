package numberFormat;

import java.text.NumberFormat;

public class NumberFormatTest {

	public static void main(String[] args) throws Exception {

		NumberFormat format1 = NumberFormat.getInstance();
		displayNumbers("default", format1);

		NumberFormat format2 = NumberFormat.getInstance();
		format2.setMinimumFractionDigits(2);
		format2.setMaximumFractionDigits(4);
		displayNumbers("min fraction digits 2, max fraction digits 4", format2);

		NumberFormat format3 = NumberFormat.getInstance();
		format3.setMinimumIntegerDigits(6);
		displayNumbers("min integer digits 6", format3);

		NumberFormat format4 = NumberFormat.getInstance();
		format4.setMaximumIntegerDigits(5);
		displayNumbers("max integer digits 5", format4);

		NumberFormat format5 = NumberFormat.getInstance();
		format5.setGroupingUsed(false);
		displayNumbers("grouping off", format5);

	}

	public static void displayNumbers(String whichFormat, NumberFormat numberFormat) {
		System.out.println("Format:" + whichFormat);
		for (int i = 0; i <= 10; i++) {
			double num = Math.PI * Math.pow(i, i) * i;
			System.out.print("  formatted:" + numberFormat.format(num));
			System.out.println(" | unformatted:" + num);
		}
		System.out.println();
	}

}