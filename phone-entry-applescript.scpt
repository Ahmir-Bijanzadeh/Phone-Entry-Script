FasdUAS 1.101.10   ��   ��    k             l     ��  ��    4 . Path to the phone numbers file on the Desktop     � 	 	 \   P a t h   t o   t h e   p h o n e   n u m b e r s   f i l e   o n   t h e   D e s k t o p   
  
 l    	 ����  r     	    l     ����  I    ��  
�� .earsffdralis        afdr  m     ��
�� afdrdesk  �� ��
�� 
rtyp  m    ��
�� 
ctxt��  ��  ��    o      ���� 0 desktoppath desktopPath��  ��        l  
  ����  r   
     b   
     o   
 ���� 0 desktoppath desktopPath  m       �   " p h o n e _ n u m b e r s . t x t  o      ���� 0 filepath filePath��  ��        l     ��������  ��  ��        l     ��   !��     e _ Check if the phone numbers file exists, if not, create it and wait for the user to populate it    ! � " " �   C h e c k   i f   t h e   p h o n e   n u m b e r s   f i l e   e x i s t s ,   i f   n o t ,   c r e a t e   i t   a n d   w a i t   f o r   t h e   u s e r   t o   p o p u l a t e   i t   # $ # l    %���� % I    �� &���� &0 checkorcreatefile checkOrCreateFile &  '�� ' o    ���� 0 filepath filePath��  ��  ��  ��   $  ( ) ( l     ��������  ��  ��   )  * + * l     �� , -��   , 3 - Read phone numbers from the file into a list    - � . . Z   R e a d   p h o n e   n u m b e r s   f r o m   t h e   f i l e   i n t o   a   l i s t +  / 0 / l    1���� 1 r     2 3 2 I    �� 4���� $0 readphonenumbers readPhoneNumbers 4  5�� 5 o    ���� 0 filepath filePath��  ��   3 o      ���� "0 rawphonenumbers rawPhoneNumbers��  ��   0  6 7 6 l     �� 8 9��   8 7 1 Sanitize the phone numbers and remove duplicates    9 � : : b   S a n i t i z e   t h e   p h o n e   n u m b e r s   a n d   r e m o v e   d u p l i c a t e s 7  ; < ; l    ( =���� = r     ( > ? > I     &�� @���� :0 sanitizeandremoveduplicates sanitizeAndRemoveDuplicates @  A�� A o   ! "���� "0 rawphonenumbers rawPhoneNumbers��  ��   ? o      ���� 0 phonenumbers phoneNumbers��  ��   <  B C B l     ��������  ��  ��   C  D E D l     �� F G��   F 3 - Prompt the user to input the message to send    G � H H Z   P r o m p t   t h e   u s e r   t o   i n p u t   t h e   m e s s a g e   t o   s e n d E  I J I l  ) 0 K���� K r   ) 0 L M L I   ) .��������  0 getusermessage getUserMessage��  ��   M o      ���� 0 messagetext messageText��  ��   J  N O N l     ��������  ��  ��   O  P Q P l     ��������  ��  ��   Q  R S R l     �� T U��   T c ] Function to check if the file exists, create it if not, and wait for the user to populate it    U � V V �   F u n c t i o n   t o   c h e c k   i f   t h e   f i l e   e x i s t s ,   c r e a t e   i t   i f   n o t ,   a n d   w a i t   f o r   t h e   u s e r   t o   p o p u l a t e   i t S  W X W i      Y Z Y I      �� [���� &0 checkorcreatefile checkOrCreateFile [  \�� \ o      ���� 0 filepath filePath��  ��   Z k     ] ] ]  ^ _ ^ O     * ` a ` Z    ) b c���� b H     d d l    e���� e I   �� f��
�� .coredoexnull���     obj  f 4    �� g
�� 
file g o    ���� 0 filepath filePath��  ��  ��   c k    % h h  i j i l   �� k l��   k A ; Inform the user that the file does not exist and create it    l � m m v   I n f o r m   t h e   u s e r   t h a t   t h e   f i l e   d o e s   n o t   e x i s t   a n d   c r e a t e   i t j  n o n I   �� p��
�� .sysodlogaskr        TEXT p m     q q � r r\ T h e   p h o n e _ n u m b e r s . t x t   f i l e   w a s   n o t   f o u n d   o n   y o u r   d e s k t o p .   A   n e w   o n e   h a s   b e e n   c r e a t e d .   P l e a s e   p o p u l a t e   i t   w i t h   p h o n e   n u m b e r s .   T h e   p r o g r a m   w i l l   w a i t   u n t i l   t h e   f i l e   h a s   c o n t e n t .��   o  s t s l   ��������  ��  ��   t  u v u l   �� w x��   w . ( Create the empty phone_numbers.txt file    x � y y P   C r e a t e   t h e   e m p t y   p h o n e _ n u m b e r s . t x t   f i l e v  z { z r     | } | I   �� ~ 
�� .rdwropenshor       file ~ o    ���� 0 filepath filePath  �� ���
�� 
perm � m    ��
�� boovtrue��   } o      ���� 0 fileref fileRef {  ��� � I    %�� ���
�� .rdwrclosnull���     **** � o     !���� 0 fileref fileRef��  ��  ��  ��   a m      � ��                                                                                  MACS  alis    @  Macintosh HD               �&�BD ����
Finder.app                                                     �����&�        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��   _  � � � l  + +��������  ��  ��   �  � � � l  + +�� � ���   � &   Wait until the file has content    � � � � @   W a i t   u n t i l   t h e   f i l e   h a s   c o n t e n t �  ��� � T   + ] � � k   0 X � �  � � � Q   0 R � � � � k   3 I � �  � � � r   3 = � � � I  3 ;�� ���
�� .rdwrread****        **** � 4   3 7�� �
�� 
file � o   5 6���� 0 filepath filePath��   � o      ���� 0 filecontent fileContent �  ��� � Z   > I � ����� � >  > A � � � o   > ?���� 0 filecontent fileContent � m   ? @ � � � � �   �  S   D E��  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��   � l  Q Q�� � ���   � P J If there's an error reading (e.g., the file is still empty), keep waiting    � � � � �   I f   t h e r e ' s   a n   e r r o r   r e a d i n g   ( e . g . ,   t h e   f i l e   i s   s t i l l   e m p t y ) ,   k e e p   w a i t i n g �  ��� � l  S X � � � � I  S X�� ���
�� .sysodelanull��� ��� nmbr � m   S T���� ��   � / ) Wait for 5 seconds before checking again    � � � � R   W a i t   f o r   5   s e c o n d s   b e f o r e   c h e c k i n g   a g a i n��  ��   X  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � ; 5 The rest of the script remains the same as before...    � � � � j   T h e   r e s t   o f   t h e   s c r i p t   r e m a i n s   t h e   s a m e   a s   b e f o r e . . . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 1 + Function to read phone numbers from a file    � � � � V   F u n c t i o n   t o   r e a d   p h o n e   n u m b e r s   f r o m   a   f i l e �  � � � i     � � � I      �� ����� $0 readphonenumbers readPhoneNumbers �  ��� � o      ���� 0 filepath filePath��  ��   � k     D � �  � � � r      � � � J     ��   � o      �~�~ 0 phonenumbers phoneNumbers �  � � � Q    A � � � � k    2 � �  � � � r     � � � I   �} ��|
�} .rdwrread****        **** � 4    �{ �
�{ 
file � o   
 �z�z 0 filepath filePath�|   � o      �y�y 0 filecontent fileContent �  � � � r     � � � n     � � � 2   �x
�x 
cpar � o    �w�w 0 filecontent fileContent � o      �v�v 0 
phonelines 
phoneLines �  ��u � X    2 ��t � � r   ) - � � � o   ) *�s�s 0 	phoneline 	phoneLine � n       � � �  ;   + , � o   * +�r�r 0 phonenumbers phoneNumbers�t 0 	phoneline 	phoneLine � o    �q�q 0 
phonelines 
phoneLines�u   � R      �p ��o
�p .ascrerr ****      � **** � o      �n�n 0 errmsg errMsg�o   � I  : A�m ��l
�m .sysodlogaskr        TEXT � b   : = � � � m   : ; � � � � � 0 E r r o r   r e a d i n g   t h e   f i l e :   � o   ; <�k�k 0 errmsg errMsg�l   �  ��j � L   B D � � o   B C�i�i 0 phonenumbers phoneNumbers�j   �  � � � l     �h�g�f�h  �g  �f   �  � � � l     �e � ��e   � = 7 Function to sanitize, normalize, and remove duplicates    � � � � n   F u n c t i o n   t o   s a n i t i z e ,   n o r m a l i z e ,   a n d   r e m o v e   d u p l i c a t e s �  � � � i     � � � I      �d ��c�d :0 sanitizeandremoveduplicates sanitizeAndRemoveDuplicates �  ��b � o      �a�a "0 rawphonenumbers rawPhoneNumbers�b  �c   � k     � � �  � � � r      � � � J     �`�`   � o      �_�_ $0 sanitizednumbers sanitizedNumbers �  � � � r    	 � � � J    �^�^   � o      �]�] 0 uniquenumbers uniqueNumbers �  � � � l  
 
�\�[�Z�\  �[  �Z   �  � � � X   
 � �Y  k    �  l   �X�X   6 0 Remove all non-numeric characters except commas    � `   R e m o v e   a l l   n o n - n u m e r i c   c h a r a c t e r s   e x c e p t   c o m m a s 	 r    '

 I   %�W�V
�W .sysoexecTEXT���     TEXT b    ! b     m     � 
 e c h o   n     1    �U
�U 
strq o    �T�T 	0 entry   m      �    |   t r   - d   '   ( ) - '�V   o      �S�S 0 cleanedentry cleanedEntry	  l  ( (�R�R   = 7 Split by commas to handle multiple numbers in one line    � n   S p l i t   b y   c o m m a s   t o   h a n d l e   m u l t i p l e   n u m b e r s   i n   o n e   l i n e  r   ( 1 n  ( / !  I   ) /�Q"�P�Q 	0 split  " #$# o   ) *�O�O 0 cleanedentry cleanedEntry$ %�N% m   * +&& �''  ,�N  �P  !  f   ( ) o      �M�M 0 
phoneparts 
phoneParts ()( l  2 2�L�K�J�L  �K  �J  ) *�I* X   2 �+�H,+ k   B �-- ./. l  B B�G01�G  0 > 8 Remove any remaining invalid characters (letters, etc.)   1 �22 p   R e m o v e   a n y   r e m a i n i n g   i n v a l i d   c h a r a c t e r s   ( l e t t e r s ,   e t c . )/ 343 r   B E565 m   B C77 �88  6 o      �F�F "0 sanitizednumber sanitizedNumber4 9:9 X   F j;�E<; Z   V e=>�D�C= E  V Y?@? m   V WAA �BB  0 1 2 3 4 5 6 7 8 9@ o   W X�B�B 0 c  > r   \ aCDC b   \ _EFE o   \ ]�A�A "0 sanitizednumber sanitizedNumberF o   ] ^�@�@ 0 c  D o      �?�? "0 sanitizednumber sanitizedNumber�D  �C  �E 0 c  < o   I J�>�> 0 phonenumber phoneNumber: GHG l  k k�=�<�;�=  �<  �;  H IJI l  k k�:KL�:  K A ; Normalize the number (remove leading 1 if it is 11 digits)   L �MM v   N o r m a l i z e   t h e   n u m b e r   ( r e m o v e   l e a d i n g   1   i f   i t   i s   1 1   d i g i t s )J NON Z   k �PQ�9�8P F   k {RSR =  k pTUT n   k nVWV 1   l n�7
�7 
lengW o   k l�6�6 "0 sanitizednumber sanitizedNumberU m   n o�5�5 S =  s yXYX n   s wZ[Z 4   t w�4\
�4 
cha \ m   u v�3�3 [ o   s t�2�2 "0 sanitizednumber sanitizedNumberY m   w x]] �^^  1Q r   ~ �_`_ c   ~ �aba n   ~ �cdc 7  ��1ef
�1 
cha e m   � ��0�0 f m   � ��/�/ d o   ~ �.�. "0 sanitizednumber sanitizedNumberb m   � ��-
�- 
TEXT` o      �,�, "0 sanitizednumber sanitizedNumber�9  �8  O ghg l  � ��+�*�)�+  �*  �)  h iji l  � ��(kl�(  k 9 3 Add to list only if the number is valid and unique   l �mm f   A d d   t o   l i s t   o n l y   i f   t h e   n u m b e r   i s   v a l i d   a n d   u n i q u ej n�'n Z   � �op�&�%o F   � �qrq l  � �s�$�#s =  � �tut n   � �vwv 1   � ��"
�" 
lengw o   � ��!�! "0 sanitizednumber sanitizedNumberu m   � �� �  
�$  �#  r l  � �x��x H   � �yy E  � �z{z o   � ��� 0 uniquenumbers uniqueNumbers{ o   � ��� "0 sanitizednumber sanitizedNumber�  �  p k   � �|| }~} r   � �� o   � ��� "0 sanitizednumber sanitizedNumber� n      ���  ;   � �� o   � ��� $0 sanitizednumbers sanitizedNumbers~ ��� l  � ����� r   � ���� o   � ��� "0 sanitizednumber sanitizedNumber� n      ���  ;   � �� o   � ��� 0 uniquenumbers uniqueNumbers�   Add to the unique set   � ��� ,   A d d   t o   t h e   u n i q u e   s e t�  �&  �%  �'  �H 0 phonenumber phoneNumber, o   5 6�� 0 
phoneparts 
phoneParts�I  �Y 	0 entry   o    �� "0 rawphonenumbers rawPhoneNumbers � ��� l  � �����  �  �  � ��� L   � ��� o   � ��� $0 sanitizednumbers sanitizedNumbers�   � ��� l     ����  �  �  � ��� l     ����  � 7 1 Helper function to split a string by a delimiter   � ��� b   H e l p e r   f u n c t i o n   t o   s p l i t   a   s t r i n g   b y   a   d e l i m i t e r� ��� i    ��� I      ���
� 	0 split  � ��� o      �	�	 0 	thestring 	theString� ��� o      �� 0 thedelimiter theDelimiter�  �
  � k     �� ��� r     ��� o     �� 0 thedelimiter theDelimiter� n     ��� 1    �
� 
txdl� 1    �
� 
ascr� ��� r    ��� n    	��� 2    	�
� 
citm� o    �� 0 	thestring 	theString� o      �� 0 theitems theItems� ��� r    ��� m    �� ���  � n     ��� 1    � 
�  
txdl� 1    ��
�� 
ascr� ���� L    �� o    ���� 0 theitems theItems��  � ��� l     ��������  ��  ��  � ��� l     ������  � C = Function to get the message input from the user (multi-line)   � ��� z   F u n c t i o n   t o   g e t   t h e   m e s s a g e   i n p u t   f r o m   t h e   u s e r   ( m u l t i - l i n e )� ��� i    ��� I      ��������  0 getusermessage getUserMessage��  ��  � k     }�� ��� r     ��� m     �� ���  � o      ���� 0 usermessage userMessage� ��� W    >��� k    9�� ��� I   ����
�� .sysodlogaskr        TEXT� m    �� ��� � P l e a s e   e n t e r   t h e   m e s s a g e   y o u   w a n t   t o   s e n d   ( y o u   c a n   w r i t e   a   m u l t i - l i n e   m e s s a g e ) :� ����
�� 
dtxt� m    �� ���  � ����
�� 
btns� J    �� ���� m    �� ���  O K��  � �����
�� 
dflt� m    �� ���  O K��  � ��� r    ��� n    ��� 1    ��
�� 
ttxt� 1    ��
�� 
rslt� o      ���� 0 usermessage userMessage� ���� Z     9������� =    #��� o     !���� 0 usermessage userMessage� m   ! "�� ���  � I  & 5����
�� .sysodlogaskr        TEXT� m   & '�� ��� d P l e a s e   e n t e r   a   m e s s a g e .   T h e   f i e l d   c a n n o t   b e   e m p t y .� ����
�� 
btns� J   ( +�� ���� m   ( )�� ���  O K��  � �����
�� 
dflt� m   , /�� ���  O K��  ��  ��  ��  � >   ��� o    	���� 0 usermessage userMessage� m   	 
�� ���  � ��� l  ? ?��������  ��  ��  �    l  ? ?����     Confirmation prompt    � (   C o n f i r m a t i o n   p r o m p t  r   ? ] I  ? [��	

�� .sysodlogaskr        TEXT	 b   ? H b   ? D m   ? B � H Y o u   e n t e r e d   t h e   f o l l o w i n g   m e s s a g e : 
 
 o   B C���� 0 usermessage userMessage m   D G � F 
 
 D o   y o u   w a n t   t o   s e n d   t h i s   m e s s a g e ?
 ��
�� 
btns J   I Q  m   I L �  C a n c e l �� m   L O �  O K��   ����
�� 
dflt m   R U �  O K��   o      ���� 0 confirmation    !  l  ^ ^��������  ��  ��  ! "#" l  ^ ^��$%��  $ / ) If user clicks "Cancel", quit the script   % �&& R   I f   u s e r   c l i c k s   " C a n c e l " ,   q u i t   t h e   s c r i p t# '(' Z   ^ z)*����) =  ^ g+,+ n   ^ c-.- 1   _ c��
�� 
bhit. o   ^ _���� 0 confirmation  , m   c f// �00  C a n c e l* R   j v��12
�� .ascrerr ****      � ****1 m   r u33 �44 T U s e r   c a n c e l e d   t h e   m e s s a g e   s e n d i n g   p r o c e s s .2 ��5��
�� 
errn5 m   n q��������  ��  ��  ( 676 l  { {��������  ��  ��  7 8��8 L   { }99 o   { |���� 0 usermessage userMessage��  � :;: l     ��������  ��  ��  ; <=< l     ��>?��  >   Sending the message   ? �@@ (   S e n d i n g   t h e   m e s s a g e= ABA l  1 �C����C O   1 �DED X   5 �F��GF k   G �HH IJI l  G G��KL��  K %  Try to send via iMessage first   L �MM >   T r y   t o   s e n d   v i a   i M e s s a g e   f i r s tJ NON Q   G �PQRP k   J |SS TUT r   J cVWV l  J _X����X 6  J _YZY 4 J P��[
�� 
icsv[ m   N O���� Z =   S ^\]\ 1   T X��
�� 
styp] m   Y ]��
�� stypsims��  ��  W o      ���� 0 targetservice targetServiceU ^_^ r   d p`a` n   d lbcb 4   g l��d
�� 
presd o   j k���� 0 	recipient  c o   d g���� 0 targetservice targetServicea o      ���� 0 targetbuddy targetBuddy_ e��e I  q |��fg
�� .ichtsendnull���     ****f o   q r���� 0 messagetext messageTextg ��h��
�� 
TO  h o   u x���� 0 targetbuddy targetBuddy��  ��  Q R      ������
�� .ascrerr ****      � ****��  ��  R l  � �ijki Q   � �lmnl k   � �oo pqp r   � �rsr l  � �t����t 6  � �uvu 4 � ���w
�� 
icsvw m   � ����� v =   � �xyx 1   � ���
�� 
stypy m   � ���
�� stypssms��  ��  s o      ���� 0 targetservice targetServiceq z{z r   � �|}| n   � �~~ 4   � ����
�� 
pres� o   � ����� 0 	recipient   o   � ����� 0 targetservice targetService} o      ���� 0 targetbuddy targetBuddy{ ���� I  � �����
�� .ichtsendnull���     ****� o   � ����� 0 messagetext messageText� �����
�� 
TO  � o   � ����� 0 targetbuddy targetBuddy��  ��  m R      ������
�� .ascrerr ****      � ****��  ��  n I  � ������
�� .sysodlogaskr        TEXT� b   � ���� m   � ��� ��� 4 F a i l e d   t o   s e n d   m e s s a g e   t o  � o   � ����� 0 	recipient  ��  j %  If iMessage fails, attempt SMS   k ��� >   I f   i M e s s a g e   f a i l s ,   a t t e m p t   S M SO ���� l  � ����� I  � ������
�� .sysodelanull��� ��� nmbr� m   � ����� ��  � * $ Changed from 2 seconds to 3 seconds   � ��� H   C h a n g e d   f r o m   2   s e c o n d s   t o   3   s e c o n d s��  �� 0 	recipient  G o   8 9���� 0 phonenumbers phoneNumbersE m   1 2���                                                                                      @ alis    8  Macintosh HD               �&�BD ����Messages.app                                                   �����&�        ����  
 cu             Applications  #/:System:Applications:Messages.app/     M e s s a g e s . a p p    M a c i n t o s h   H D   System/Applications/Messages.app  / ��  ��  ��  B ���� l     ��������  ��  ��  ��       �����������  � �������������� &0 checkorcreatefile checkOrCreateFile�� $0 readphonenumbers readPhoneNumbers�� :0 sanitizeandremoveduplicates sanitizeAndRemoveDuplicates�� 	0 split  ��  0 getusermessage getUserMessage
�� .aevtoappnull  �   � ****� �� Z��������� &0 checkorcreatefile checkOrCreateFile�� �~��~ �  �}�} 0 filepath filePath��  � �|�{�z�| 0 filepath filePath�{ 0 fileref fileRef�z 0 filecontent fileContent�  ��y�x q�w�v�u�t�s ��r�q�p�o
�y 
file
�x .coredoexnull���     obj 
�w .sysodlogaskr        TEXT
�v 
perm
�u .rdwropenshor       file
�t .rdwrclosnull���     ****
�s .rdwrread****        ****�r  �q  �p 
�o .sysodelanull��� ��� nmbr� ^� '*�/j  �j O��el E�O�j Y hUO 1hZ *�/j E�O�� Y hW X 
 hO�j [OY��� �n ��m�l���k�n $0 readphonenumbers readPhoneNumbers�m �j��j �  �i�i 0 filepath filePath�l  � �h�g�f�e�d�c�h 0 filepath filePath�g 0 phonenumbers phoneNumbers�f 0 filecontent fileContent�e 0 
phonelines 
phoneLines�d 0 	phoneline 	phoneLine�c 0 errmsg errMsg� 
�b�a�`�_�^�]�\�[ ��Z
�b 
file
�a .rdwrread****        ****
�` 
cpar
�_ 
kocl
�^ 
cobj
�] .corecnte****       ****�\ 0 errmsg errMsg�[  
�Z .sysodlogaskr        TEXT�k EjvE�O /*�/j E�O��-E�O �[��l kh ��6F[OY��W X  �%j 	O�� �Y ��X�W���V�Y :0 sanitizeandremoveduplicates sanitizeAndRemoveDuplicates�X �U��U �  �T�T "0 rawphonenumbers rawPhoneNumbers�W  � 	�S�R�Q�P�O�N�M�L�K�S "0 rawphonenumbers rawPhoneNumbers�R $0 sanitizednumbers sanitizedNumbers�Q 0 uniquenumbers uniqueNumbers�P 	0 entry  �O 0 cleanedentry cleanedEntry�N 0 
phoneparts 
phoneParts�M 0 phonenumber phoneNumber�L "0 sanitizednumber sanitizedNumber�K 0 c  � �J�I�H�G�F&�E7A�D�C�B]�A�@�?
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
strq
�F .sysoexecTEXT���     TEXT�E 	0 split  
�D 
leng�C 
�B 
cha 
�A 
bool
�@ 
TEXT�? 
�V �jvE�OjvE�O ��[��l kh ��,%�%j E�O)��l+ E�O ��[��l kh �E�O #�[��l kh � 
��%E�Y h[OY��O��,� 	 
��k/� �& �[�\[Zl\Z�2a &E�Y hO��,a  	 ���& ��6FO��6FY h[OY��[OY�[O�� �>��=�<���;�> 	0 split  �= �:��: �  �9�8�9 0 	thestring 	theString�8 0 thedelimiter theDelimiter�<  � �7�6�5�7 0 	thestring 	theString�6 0 thedelimiter theDelimiter�5 0 theitems theItems� �4�3�2�
�4 
ascr
�3 
txdl
�2 
citm�; ���,FO��-E�O���,FO�� �1��0�/���.�1  0 getusermessage getUserMessage�0  �/  � �-�,�- 0 usermessage userMessage�, 0 confirmation  � ����+��*��)��(�'�&�%�����$�#/�"�!3
�+ 
dtxt
�* 
btns
�) 
dflt�( 
�' .sysodlogaskr        TEXT
�& 
rslt
�% 
ttxt�$ 
�# 
bhit
�" 
errn�!���. ~�E�O 9h�������kv��� 
O��,E�O��  ���kv�a a  
Y h[OY��Oa �%a %�a a lv�a a  
E�O�a ,a   )a a la Y hO�� � ������
�  .aevtoappnull  �   � ****� k     ���  
��  ��  #��  /��  ;��  I�� A��  �  �  � �� 0 	recipient  � !����� �������������
��	��������� �����
� afdrdesk
� 
rtyp
� 
ctxt
� .earsffdralis        afdr� 0 desktoppath desktopPath� 0 filepath filePath� &0 checkorcreatefile checkOrCreateFile� $0 readphonenumbers readPhoneNumbers� "0 rawphonenumbers rawPhoneNumbers� :0 sanitizeandremoveduplicates sanitizeAndRemoveDuplicates� 0 phonenumbers phoneNumbers�  0 getusermessage getUserMessage� 0 messagetext messageText
� 
kocl
� 
cobj
� .corecnte****       ****
�
 
icsv�  
�	 
styp
� stypsims� 0 targetservice targetService
� 
pres� 0 targetbuddy targetBuddy
� 
TO  
� .ichtsendnull���     ****�  �  
�  stypssms
�� .sysodlogaskr        TEXT
�� .sysodelanull��� ��� nmbr� ����l E�O��%E�O*�k+ O*�k+ E�O*�k+ 
E�O*j+ E�O� � ��[�a l kh   7*a k/a [a ,\Za 81E` O_ a �/E` O�a _ l W MX   7*a k/a [a ,\Za 81E` O_ a �/E` O�a _ l W X  a �%j Omj  [OY�qU ascr  ��ޭ