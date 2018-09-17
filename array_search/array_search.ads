package Array_Search is
   type Positive_Array is array (Natural range <>) of Positive;

   type Search_Result (Found : Boolean := False) is record
      case Found is
         when True =>
            Content : Integer;
         when False => null;
      end case;
   end record;

   procedure Search_Array
      (A       : Positive_Array;
       E       : Positive;
       Result  : out Search_Result)
   with Pre => not Result'Constrained;
end Array_Search;
