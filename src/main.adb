with Ada.Text_IO;

procedure Main is
   package TIO renames Ada.Text_IO;
   package IIO is new Ada.Text_IO.Integer_IO (Integer);
   package FIO is new Ada.Text_IO.Float_IO (Float);

   type Card;
   type Card_Acc is access Card;
   type Suit is (Clubs, Diamonds, Hearts, Spades);
   type Card is record
      Rank_Value : Integer;
      Suit_Value : Suit;
      Next_Card : Card_Acc;
   end record;
   --type Card_Acc is access Card; -- won't work because Card was not defined and Card_Acc was used before it was defined.

   --  Start_Card : Card_Acc;
   Start_Card : constant Card_Acc := new Card;
   Current_Card : Card_Acc;

begin
   --  Start_Card := new Card'(Rank_Value=> 8, Suit_Value => Spades, Next_Card => null); --Can no longer use this as it is a constant
   Start_Card.Rank_Value := 8; --Can still set the access values of start_card even though it is a constant.
   Start_Card.Suit_Value := Spades;
   IIO.Put(Start_Card.Rank_Value); TIO.New_Line;
   Start_Card.Next_Card := new Card'(Rank_Value => 10, Suit_Value => Spades, Next_Card => null);
   --  Current_Card := Start_Card;
   Current_Card := Start_Card.Next_Card;
   Start_Card.all := Current_Card.all;
   --  IIO.Put(Start_Card.Next_Card.Rank_Value); TIO.New_Line;
   IIO.Put(Current_Card.Rank_Value); TIO.New_Line;
   IIO.Put(Start_Card.Rank_Value);
   --  Current_Card := Start_Card.Next_Card;
end Main;
