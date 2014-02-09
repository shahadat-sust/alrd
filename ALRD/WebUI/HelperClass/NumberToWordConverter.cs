using System;

namespace WebUI.HelperClass
{

    public class NumberToWordConverter
    {

        private static string[] _smallNumbers = new string[] { "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
        private static string[] _tens = new string[] { "", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
        private static string[] _scaleNumbers = new string[] { "", "Thousand", "Million", "Billion" };

        public static string NumberToWords(int number, bool needAnd = false)
        {

            int ind = -99, k = 0;
            bool flag = false;

            if (number == 0)
                return _smallNumbers[0];

            int[] digitGroups = new int[4];
            int positive = Math.Abs(number);


            for (int i = 0; i < 4; i++)
            {
                digitGroups[i] = positive % 1000;
                positive /= 1000;
            }

            if (needAnd)
            {

                for (; k < 4; k++)
                {
                    if (digitGroups[k] > 0)
                    {
                        ind = k;
                        k++;
                        break;
                    }
                }

                for (; k < 4; k++)
                {
                    if (digitGroups[k] > 0)
                    {
                        flag = true;
                        break;
                    }
                }
            }


            string[] groupText = new string[4];

            for (int i = 0; i < 4; i++)
                if (ind == i && flag == true)
                    groupText[i] = ThreeDigitGroupToWords(digitGroups[i], true);
                else
                    groupText[i] = ThreeDigitGroupToWords(digitGroups[i], false);

            string combined = groupText[0];
            bool appendAnd;


            appendAnd = (digitGroups[0] > 0) && (digitGroups[0] < 100);


            for (int i = 1; i < 4; i++)
            {

                if (digitGroups[i] != 0)
                {

                    string prefix = groupText[i] + " " + _scaleNumbers[i];

                    if (combined.Length != 0)
                        prefix += appendAnd ? "" : " ";

                    appendAnd = false;

                    combined = prefix + combined;
                }
            }


            if (number < 0)
                combined = "Negative " + combined;

            return combined;
        }





        private static string ThreeDigitGroupToWords(int threeDigits, bool flag)
        {

            string groupText = "";


            int hundreds = threeDigits / 100;
            int tensUnits = threeDigits % 100;


            if (hundreds != 0)
            {
                groupText += _smallNumbers[hundreds] + " Hundred";

                if (tensUnits != 0)
                    groupText += "";
                else if (flag)
                    groupText = " and " + groupText;

            }




            int tens = tensUnits / 10;
            int units = tensUnits % 10;


            if (tens >= 2)
            {
                if (flag)
                    groupText += " and " + _tens[tens];
                else
                    groupText += " " + _tens[tens];

                if (units != 0)
                    groupText += " " + _smallNumbers[units];
            }
            else if (tensUnits != 0)
            {
                if (flag)
                    groupText += " and " + _smallNumbers[tensUnits];
                else
                    groupText += " " + _smallNumbers[tensUnits];
            }

            return groupText;
        }
    }
}