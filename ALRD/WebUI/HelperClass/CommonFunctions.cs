using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web.UI.WebControls;

namespace WebUI.HelperClass
{
    public static class CommonFunctions
    {
        public static DateTime? GetDateFromString(string date)
        {
            return date.Trim() != string.Empty ? DateTime.Parse(date.Trim(), new CultureInfo("fr-FR")) : new DateTime(1900, 1, 1);
        }
        public static string GetStringFromDate(DateTime? date)
        {
            if (date.HasValue)
                return date.Value.ToString("dd-MM-yyyy");
            else
                return "";

        }
        public static string GetPropertyName<TSource, TProperty>(this Expression<Func<TSource, TProperty>> expression)
        {
            PropertyInfo propertyInfo = GetPropertyInfo(expression);
            return propertyInfo.Name;
        }

        public static PropertyInfo GetPropertyInfo<TSource, TProperty>(this Expression<Func<TSource, TProperty>> expression)
        {
            var memberExpression = expression.Body as MemberExpression;
            var propertyInfo = memberExpression.Member as PropertyInfo;
            return propertyInfo;
        }

        public static List<T> IndentEntity<T>(List<T> list, string displayPropertyName, string indentPropertyName, int paddingWidth = 6, int StartIndex = 0)
        {
            Type type = typeof(T);

            PropertyInfo displayProperty = type.GetProperty(displayPropertyName);
            PropertyInfo indentProperty = type.GetProperty(indentPropertyName);

            for (int x = StartIndex; x < list.Count; x++)
            {
                int intIndentIndex = (int)indentProperty.GetValue(list[x], null);
                string val = displayProperty.GetValue(list[x], null).ToString();
                val = val.PadLeft((paddingWidth * (intIndentIndex - 1)) + val.Length);
                displayProperty.SetValue(list[x], val, null);
            }
            return list;
        }

        public static ListItem [] GetUniqueListItem<T>(List<T> list, string displayPropertyName)
        {
            Type type = typeof(T);
            List<ListItem> itemList = new List<ListItem>();
            PropertyInfo displayProperty = type.GetProperty(displayPropertyName);
            foreach (var item in list)
            {
                string val = displayProperty.GetValue(item, null).ToString();
                if (!itemList.Exists(q => q.Text == val))
                {
                    itemList.Add(new ListItem(val, (itemList.Count +1).ToString()));
                }
            }

            return itemList.ToArray();
        }

        public static void CopyEntity<T>(T CopyFrom, ref T CopyTo)
        {
            foreach (System.Reflection.PropertyInfo propInfo in typeof(T).GetProperties())
            {
                object valueToCopy = propInfo.GetValue(CopyFrom, null);
                propInfo.SetValue(CopyTo, valueToCopy, null);
            }
        }

        public static T CopyEntity<T>(T CopyFrom)
        {
            T obj = (T)Activator.CreateInstance(typeof(T));
            foreach (System.Reflection.PropertyInfo propInfo in typeof(T).GetProperties())
            {
                object valueToCopy = propInfo.GetValue(CopyFrom, null);
                propInfo.SetValue(obj, valueToCopy, null);
            }
            return obj;
        }

        public static T CopyEntity<T, X>(X CopyFrom)
        {
            T obj = (T)Activator.CreateInstance(typeof(T));
            foreach (System.Reflection.PropertyInfo propInfo in typeof(X).GetProperties())
            {
                if (typeof(T).GetProperties().ToList().Exists(q => q.Name == propInfo.Name))
                {
                    object valueToCopy = propInfo.GetValue(CopyFrom, null);
                    propInfo.SetValue(obj, valueToCopy, null);
                }
            }
            return obj;
        }

        public static List<T> CopyEntityList<T>(List<T> CopyFrom)
        {
            List<T> tlist = new List<T>();
            foreach (T item in CopyFrom)
            {
                T obj = (T)Activator.CreateInstance(typeof(T));
                foreach (System.Reflection.PropertyInfo propInfo in typeof(T).GetProperties())
                {
                    object valueToCopy = propInfo.GetValue(item, null);
                    propInfo.SetValue(obj, valueToCopy, null);
                }
                tlist.Add(obj);
            }

            return tlist;
        }

        public static List<T> GetTreeChild<T>(List<T> llist, T selectedNode, string keyPropName, string parentPropName, int endLevel = 0, int level = 0)
        {
            List<T> entity = new List<T>();
            List<T> list = new List<T>(llist);
            Type type = typeof(T);
            PropertyInfo keyProp = type.GetProperty(keyPropName);
            string _selectedNodekey = keyProp.GetValue(selectedNode, null).ToString();
            PropertyInfo parentProp = type.GetProperty(parentPropName);
            foreach (T item in list)
            {
                string _key = keyProp.GetValue(item, null).ToString();
                string _parent = parentProp.GetValue(item, null).ToString();
                if (_selectedNodekey == _parent)
                {
                    T obj = (T)Activator.CreateInstance(typeof(T));
                    obj = item;
                    entity.Add(obj);
                    if (level == endLevel && level != 0) break;
                    entity.AddRange(GetTreeChild<T>(list, obj, keyPropName, parentPropName, level + 1));
                }
            }
            return entity;
        }

        public static List<T> GetTreeParant<T>(List<T> llist, T selectedNode, string keyPropName, string parentPropName, int endLevel = 0, int level = 0)
        {
            List<T> entity = new List<T>();
            List<T> list = new List<T>(llist);
            Type type = typeof(T);
            PropertyInfo keyProp = type.GetProperty(keyPropName);
            PropertyInfo parentProp = type.GetProperty(parentPropName);

            string _selectedNodekey = parentProp.GetValue(selectedNode, null).ToString();

            foreach (T item in list)
            {
                string _key = keyProp.GetValue(item, null).ToString();
                string _parent = parentProp.GetValue(item, null).ToString();
                if (_selectedNodekey == _key)
                {
                    T obj = (T)Activator.CreateInstance(typeof(T));
                    obj = item;
                    entity.Add(obj);
                    if (level == endLevel && level != 0) break;
                    entity.AddRange(GetTreeParant<T>(list, obj, keyPropName, parentPropName, level + 1));
                }
            }
            entity.Add(selectedNode);
            return entity;
        }

        public static string GetTreeParant<T>(List<T> llist, T selectedNode, string keyPropName, string parentPropName, string valuePropName, string separator = ",")
        {
            string str = "";
            List<T> entity = new List<T>();
            List<T> list = new List<T>(llist);
            Type type = typeof(T);
            PropertyInfo keyProp = type.GetProperty(keyPropName);
            PropertyInfo parentProp = type.GetProperty(parentPropName);
            PropertyInfo valueProp = type.GetProperty(valuePropName);

            string _selectedNodekey = parentProp.GetValue(selectedNode, null).ToString();
            string _selectedNodeValue = valueProp.GetValue(selectedNode, null).ToString().Trim();

            foreach (T item in list)
            {
                string _key = keyProp.GetValue(item, null).ToString();
                string _parent = parentProp.GetValue(item, null).ToString();
                if (_selectedNodekey == _key)
                {
                    T obj = (T)Activator.CreateInstance(typeof(T));
                    obj = item;

                    str = (GetTreeParant<T>(list, obj, keyPropName, parentPropName, valuePropName, separator)) + separator + str;
                }
            }
            return str + _selectedNodeValue;
        }

        public static T CopyObject<T>(T obj)
        {
            if (obj == null)
            {
                return obj;
            }
            using (MemoryStream ms = new MemoryStream())
            {
                (new BinaryFormatter()).Serialize(ms, obj);

                ms.Seek(0, SeekOrigin.Begin);

                return (T)(new BinaryFormatter()).Deserialize(ms);
            }
        }

        public static string Encript(string obj)
        {
            return obj;
        }

        public static string Decript(string obj)
        {
            return obj;
        }
    }
}