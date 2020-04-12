 ;author:    -Alfian Badrul Isnan            <Teknik Komputer - 1806148643 >
;           -Ricky                          <Teknik Komputer - 1806199921 >
;           -Suryanoto Negoro               <Teknik Komputer - 1806200122 >
;           -Yusuf Abraham Bismo Kristanto  <Teknik Komputer - 1806200274 >
;Kelompok :1A
;Judul    :Dr Chord
;---------------------------------------------------------------------------------------------------------------------------------
;Cara menggunakan:      1. Not Natural : asdfghjkl
;	                    2. Not Kres    : wetyuop
;	                    3. Range Nada  : C1-E2 
;	                    4. Maks 5 not untuk mencari chord
;	                    5. SPACE=PLAY, BACKSPACE=CLEAR
;	                    6. Ganti warna tema buka setting 
;                       7. No 1&2 digunakan untuk menjalankan chord recognizer pada piano
;---------------------------------------------------------------------------------------------------------------------------------
;
;                       Dr.Chord merupakan aplikasi yang melakukan recognition input ke chord
;               
;                       Copyright <C> Kelompok 1A Teknik Komputer 2018
;                       
;                       Program merupakan program gratis yang dapat digunakan sebagai bahan 
;                       pembelajaran maupun referensi bagi praktikan di masa yang akan datang.
;---------------------------------------------------------------------------------------------------------------------------------	
;Referensi: https://github.com/nthnfaustine/PianoWave
;           http://www.angelfire.com/in2/yala/t4chords.htm

;Color Database
cblk = 00000000b ;Color Black
cblu = 00000001b ;Color Blue
cgrn = 00000010b ;Color Green
ccyn = 00000011b ;Color Cyan
cred = 00000100b ;Color Red
cmag = 00000101b ;Color Magenta
cbrn = 00000110b ;Color Brown
clgy = 00000111b ;Color Light Gray
cdgy = 00001000b ;Color Dark Gray
clbl = 00001001b ;Color Light Blue
clgr = 00001010b ;Color Light Green
clcy = 00001011b ;Color Light Cyan
clrd = 00001100b ;Color Light Red
clmg = 00001101b ;Color Light Magenta
cylw = 00001110b ;Color Yellow
cwht = 00001111b ;Color White
;Position
pposx= 10
pposy= 14
;Piano Index
pnc1 = 0 ;0
pnc1s= 4 ;1
pnd1 = 8 ;2
pnd1s= 12;3
pne1 = 16;4
pnf1 = 20;5
pnf1s= 24;6
png1 = 28;7
png1s= 32;8
pna1 = 36;9
pna1s= 40;10
pnb1 = 44;11
pnc2 = 48;12
pnc2s= 52;13
pnd2 = 56;14
pnd2s= 60;15
pne2 = 64;16
pall = 0ffh
;Control and Color
pc_u = 1 ;Piano Control Up/Unpressed
pc_d = 0 ;Piano Control Down/Pressed



.MODEL SMALL
.STACK
.DATA
	chord	dw 100010010000b ;Maj
			dw 100010100000b ;Maj(-5)
			dw 100100010000b ;min
			dw 100100001000b ;min+5
			dw 100010001000b ;aug5
			dw 100100100000b ;dim5
			dw 100001010000b ;sus4
			;dw 100001001000b ;aug5sus4
			dw 100001100000b ;dim5sus4
			dw 101000010000b ;sus2
			dw 101000001000b ;aug5sus2
			dw 101000100000b ;dim5sus2
			dw 100010010100b ;6
			dw 100010010010b ;7
			dw 100010010001b ;M7
			dw 101010010000b ;add9
			dw 100011010000b ;add11
			dw 100010100100b ;6(-5)
			dw 100010100010b ;7(-5)
			dw 100010100001b ;M7(-5)
			dw 100100011000b ;min(-6)
			dw 100100010100b ;min6
			dw 100100010010b ;min7
			dw 100100010001b ;min M7
			dw 110100010000b ;min add(-9)
			dw 101100010000b ;min add9
			dw 100101010000b ;min add11
			dw 100010001010b ;aug5/7
			dw 100010001001b ;aug5M7
			dw 101010001000b ;aug5 add9
			dw 100100100100b ;dim7
			dw 100100100010b ;dim5/7
			dw 101100100000b ;dim5 add9
			dw 100001011000b ;(-6)sus4
			dw 100001010100b ;6sus4
			dw 100001010010b ;7sus4
			dw 100001010001b ;M7sus4
			dw 110001010000b ;sus4add(-9)
			dw 101000011000b ;(-6)sus2
			dw 101000010100b ;6sus2
			dw 101000010010b ;7sus2
			dw 101000010001b ;M7sus2
			dw 101010010100b ;6add9
			dw 100011010100b ;6add11
			dw 101010010010b ;7add9
			dw 100011010010b ;7add11
			dw 100010010110b ;7add13
			dw 101010010001b ;M7add9
			dw 100011010001b ;M7add11
			dw 100010010101b ;M7add13
			dw 101010100100b ;605add9
			dw 101010100001b ;M705add9
			dw 100010100101b ;M705add13
			dw 101100010100b ;min6add9
			dw 100101010100b ;min6add11
			dw 101100010010b ;min7add9
			dw 100101010010b ;min7add11
			dw 100100010110b ;min7add13
			dw 101100010001b ;m7add9
			dw 100101010001b ;m7add11
			dw 100100010101b ;M7add13
			dw 101010001010b ;aug5/7add9
			dw 100011001010b ;aug5/7add11
			dw 100010001110b ;aug5/7add13
			dw 101100100010b ;dim5/7add9
			dw 100101100010b ;dim5/7add11
			dw 100100100110b ;dim5/7add13
			dw 101001010100b ;6sus4add9
			dw 101001010010b ;7sus4add9
			dw 100001010110b ;7sus4add9
			dw 101001010001b ;M7sus4add9
			dw 100001010101b ;M7sus4add13
			dw 100001010110b ;7sus2add13
			dw 101000010101b ;M72susadd13
			dw 0
chord_str	db "   Maj$         "
			db "   Maj(-5)$     "
			db "   min$         "
			db "   min+5$       "
			db "   aug5$        "
			db "   dim5$        "
			db "   sus4$        "
			;db "   aug5sus4$    "
			db "   dim5sus4$    "
			db "   sus2$        "
			db "   aug5sus2$    "
			db "   dim5sus2$    "
			db "   6$           "
			db "   7$           "
			db "   M7$          "
			db "   add9$        "
			db "   add11$       "
			db "   6(-5)$       "
			db "   7(-5)$       "
			db "   M7(-5)$      "
			db "   min(-6)$     "
			db "   min6$        "
			db "   min7$        "
			db "   min M7$      "
			db "   min add(-9)$ "
			db "   min add9$    "
			db "   min add11$   "
			db "   aug5/7$      "
			db "   aug5M7$      "
			db "   aug5 add9$   "
			db "   dim7$        "
			db "   dim5/7$      "
			db "   dim5 add9$   "
			db "   (-6)sus4$    "
			db "   6sus4$       "
			db "   7sus4$       "
			db "   M7sus4$      "
			db "   sus4add(-9)$ "
			db "   (-6)sus2$    "
			db "   6sus2$       "
			db "   7sus2$       "
			db "   M7sus2$      "
			db "   6add9$       "
			db "   6add11$      "
			db "   7add9$       "
			db "   7add11$      "
			db "   7add13$      "
			db "   M7add9$      "
			db "   M7add11$     "
			db "   M7add13$     "
			db "   605add9$     "
			db "   M705add9$    "
			db "   M705add13$   "
			db "   min6add9$    "
			db "   min6add11$   "
			db "   min7add9$    "
			db "   min7add11$   "
			db "   min7add13$   "
			db "   m7add9$      "
			db "   m7add11$     "
			db "   M7add13$     "
			db "   aug5/7add9$  "
			db "   aug5/7add11$ "
			db "   aug5/7add13$ "
			db "   dim5/7add9$  "
			db "   dim5/7add11$ "
			db "   dim5/7add13$ "
			db "   6sus4add9$   "
			db "   7sus4add9$   "
			db "   7sus4add9$   "
			db "   M7sus4add9$  "
			db "   M7sus4add13$ "
			db "   7sus2add13$  "
			db "   M72susadd13$ "
chord_notesA db "   C$ "
            db "   C#$"
            db "   D$ "
            db "   D#$"
            db "   E$ "
            db "   F$ "
            db "   F#$"
            db "   G$ "
            db "   G#$"
            db "   A$ "
            db "   A#$"
			db "   B$ "
chord_notesB db "   C$ "
            db "   Db$"
            db "   D$ "
            db "   Eb$"
            db "   E$ "
            db "   F$ "
            db "   Gb$"
            db "   G$ "
            db "   Ab$"
            db "   A$ "
            db "   Bb$"
            db "   B$ "
clearchord	db 20,10,15,'$'
clearcount	db 20,10,15,'$'
	prefix  db 0
	delay	dw 2
	ploop	dw 0
	pn_cnat_u db cwht ;Piano Color for Natural Note Up/Unpressed
	pn_cshr_u db clgy ;Piano Color for Sharp Note Up/Unpressed
	pn_cnat_d db cblu ;Piano Color for Natural Note Down/Pressed
	pn_cshr_d db cred ;Piano Color for Sharp Note Down/Pressed
	col_std_c db cwht
	col_ran_s db 0
	wvar1 	dw 	0     
	bvar1 	db 	0
	cvar1	db	cwht
	mem		dw 0
	timer	dw 0
	piano 	dw 	1, 00	;C1
			dw	4, 00	;C1s
			dw	2, 30	;D1
			dw	4, 30	;D1s
			dw	3, 60	;E1
			dw	1, 90	;F1
			dw	4, 90	;F1s
			dw	2, 120	;G1
			dw	4, 120	;G1s
			dw	2, 150	;A1
			dw	4, 150	;A1s
			dw	3, 180	;B1
			dw	1, 210	;C2
			dw	4, 210	;C2s
			dw	2, 240	;D2
			dw	4, 240	;D2s
			dw	3, 270, 0ffh	;E2
	notfreq dw 4560, 4304, 4063, 3834, 3619, 3416, 3224, 3043, 2873
			dw 2711, 2559, 2415, 2280, 2152, 2031, 1917, 1809, 0
	pno_strA db "awsedftgyhujkolp;"
	pno_strB db "AWSEDFTGYHUJKOLP:"
	pno_strchk db "   "
	pno_strC db 17 dup(0)
			 db '$'
	pno_count db 0
	pno_chord dw 0
	;string
	test1	db "   HelloWorld$"
	test2 	db "   SuperManIsDead$"
	head1	db "   Dr.Chord$"
	head2	db "   Proyek UTS SBK Kelompok$"
	menu2	db "   1   - Recognition$"
	menu3	db "   2   - About$"
	menu4	db "   3   - Setting$"
	menu5	db "   4   - Help$"
	nmenu1  db "   ABOUT$"
	nmenu2  db "   SETTING$"
	nmenu3  db "   HELP$"
	help1	db "   ESC - Exit$"
	help2	db "   SPACE - Play$"
	help3	db "   BCKSP - Erase$"
	help4	db "   Chord :$"
	help5	db "   Count :$"
	help7	db "   State :$"
	help8	db 15, 12, 17, "Maximum Reached$"
	help9	db "   ESC - Return & Apply$"
	help10	db "   BCKSP - Reset$"
	help12	db 19, 20, 21, "Notes Count Is Zero$"
	help13  db 15,10,15,"Unrecognizeable$"
	set0	db "   2. Standard TextColor      =$"
	set1	db "   1. Randomize TextColor     =$"
	set2	db "   3. NotesColor Nat unpushed =$"
	set3	db "   4. NotesColor Nat pushed   =$"
	set4	db "   5. NotesColor Shp unpushed =$"
	set5	db "   6. NotesColor Shp pushed   =$"
	set7	db "   8. NotesDelay              =$"
	set6	db "   7. NotesPrefix             =$"
	state1	db "   Listening$"
	state2  db "   Playing  $"
	t_true	db "   TRUE $"
	t_false	db "   FALSE$"
	pref_s	db "   SHARP$"
	pref_f  db "   FLAT $"
	nabout2 db "   Aplikasi database chord, dimana$"
	nabout3 db "   aplikasi akan berisi chord dan chord$"
	nabout4 db "   recognition untuk mengenali susunan$"
	nabout5 db "   note yang dapat membentuk chord$"
	nabout6 db "   tertentu dari input user. Tersedia$"
	nabout7 db "   juga virtual piano untuk mencoba$"
	nabout8 db "   susunan chord tersebut.$"
	nhelp1  db "   1. Not Natural : asdfghjkl$"
	nhelp2  db "   2. Not Kres    : wetyuop$"
	nhelp3  db "   3. Range Nada  : C1-E2$" 
	nhelp4  db "   4. Maks 5 not untuk mencari chord$"
	nhelp5  db "   5. SPACE=PLAY, BACKSPACE=CLEAR$"
	nhelp6  db "   6. Ganti warna tema buka setting$"
	
.CODE
;MACRO
    svm macro ;set video mode
        mov al, 13h
        mov ah, 0
		int 10h
		mov ax, 1003h
		mov bx, 0 ; disable blinking.
		int 10h 

    endm
    dpx macro color, x, y ;Draw Pixel
        mov al, color
        mov cx, x
        mov dx, y
        call pdpx
    endm
    dbl macro color, xa, ya, xb, yb ;draw box/line
        mov al, color
        mov wvar1, xa
        mov dx, ya
        mov di, xb
        mov si, yb
        call pdbl
    endm
	dblx macro color ;draw box/line from register
		mov al, color
		pop si
		pop di
		pop dx
		pop wvar1
        call pdbl
	endm
    dpno macro ptype, color, x,y ;draw piano notes
		mov bl, ptype
		mov bh, color
		mov ax, x
		mov dx, y
		call ppnochk
	endm
	dpnoa macro id, state ;draw piano notes with ID
		mov al, id
		mov ah, state
		call ppno
	endm
	dpnoall macro ;draw piano all notes by calling pdpnoall
		call pdpnoall
	endm
	c macro x, y
		mov dh, y
		mov dl, x
		call scp
	endm
	printf macro msg, col, x, y ;print string function byte 1 = length, byte 2 = x coord, byte 3 = y coord.
		push si
		c x,y
		mov bh, 0
		mov ah, 03h
		int 10h
		mov msg[1], dl
		mov msg[2], dh
		mov bl, col
		;shl bl, 4
		;or bl, fore
		lea si, msg
		call pwasc
		sub si, offset msg
		mov bx, si
		sub bl, 3
		mov msg[0], bl
		pop si
	endm
	clearf macro msg ;clear string function
		c msg[1], msg[2]
		mov ch, 0
		mov cl, msg[0]
		call pdasc
		mov al, msg[1]
		add al, msg[0]
		c al, msg[2]
	endm
	stop macro ;stop beep
		mov ax, mem
		and al, 0fch
		out 61h, al
	endm
	play macro sound ;play beep macro
		mov dx, sound
		call pplay
	endm
;PROC
	pplay proc ;play beep function
		mov al, 0b6h
		out 43h, al
		mov al, dl
		out 42h, al
		mov al, dh
		out 42h, al
		in al, 061h
		or al, 03h
		out 61h, al
		mov mem, ax
	ret
	endp     
	pdpnoall proc ;proc for draw all piano notes
		mov bx, 0
		loop_dpnoall:
		push bx
		mov ah, pc_u
		mov al, bl
		call ppno
		pop bx
		add bx, 4
		cmp piano[bx], 0ffh
		jne loop_dpnoall
		ret
	endp
	pwasc proc ;proc write a string character until $
		add si, 3
		j_wasc:
		push bx
		mov al, [si]
		call wacc
		add si, 1
		mov al, [si]
		pop bx
		cmp al, '$'
		jne j_wasc
		ret
	endp
	pdasc proc ;proc delete a string charcter
		mov al, ' '
		mov bh, 0
		mov ah, 0ah
		int 10h
		mov bh, 0
		mov ah, 03h
		int 10h
		add dl, 1
		c dh, dl
		ret
	endp
    pdpx proc ;proc draw piano pixel
        mov ah, 0ch
        int 10h
        ret
    endp
    pdbl proc ;piano draw box line
        loop_col:
        mov cx, wvar1
        loop_row:
        cmp cx, di
        jge ex_loop_row
        inc cx
        call pdpx
        jmp loop_row
        ex_loop_row:        
        cmp dx, si
        jge ex_loop_col
        inc dx
        jmp loop_col
        ex_loop_col:
        ret
    endp
	ppnochk proc ;proc piano check for drawing
		cmp bl, 1
		jne dpno_skip1
			call psln
		jmp dpno_end
		dpno_skip1:
		cmp bl, 2
		jne dpno_skip2
			call pcwn
		jmp dpno_end
		dpno_skip2:
		cmp bl, 3
		jne dpno_skip3
			call psrn
		jmp dpno_end
		dpno_skip3:
		cmp bl, 4
		jne dpno_end
			call pcbn
		dpno_end:
		ret
	endp
    psln proc ;proc to draw piano white left notes
		add ax, 1
		mov di, ax
		mov si, dx
		add di, 17
		add si, 59
		push ax
		push dx
		push di
		push si
		add dx, 60
		add di, 10
		add si, 35
		push ax
		push dx
		push di
		push si
		dblx bh
		dblx bh
		ret 
    endp
    psrn proc ;proc to draw piano right notes
		add ax, 1
		mov di, ax
		mov si, dx
		add di, 10
		push di
		push dx
		add di, 17
		push di
		add si, 59
		push si
		add dx, 60
		add si, 35
		push ax
		push dx
		push di
		push si
		dblx bh
		dblx bh
		ret 
    endp
    pcwn proc ;proc to draw piano white middle notes
		add ax, 1
		mov di, ax
		mov si, dx
		add di, 10
		push di
		add si, 59
		push dx
		add di, 7
		push di
		push si
		add dx, 60
		add di, 10
		add si, 35
		push ax
		push dx
		push di
		push si
		dblx bh
		dblx bh
		ret 
    endp
	pcbn proc ;proc to draw black notes
		add ax, 21
		mov di, ax
		mov si, dx
		add di, 17
		add si, 56
		push ax
		push dx
		push di
		push si
		dblx bh
		ret 
    endp
	ppno proc ;proc to draw piano from ID and state
		;al ID
		;ah state
		mov dl, al
		mov dh, 0
		mov si, dx
		mov bx, piano[si] ;piano type
		cmp bx, 4
		je pno_sharp
			cmp ah, pc_u
			je pno_nsharp_u
				mov bh, pn_cnat_d
			jmp pno_nsharp_d
			pno_nsharp_u:
				mov bh, pn_cnat_u
			pno_nsharp_d:
		jmp pno_nsharp
		pno_sharp:
			cmp ah, pc_u
			je pno_sharp_u
				mov bh, pn_cshr_d
			jmp pno_sharp_d
			pno_sharp_u:
				mov bh, pn_cshr_u
			pno_sharp_d:
		pno_nsharp:
		mov ax, piano[si+2]
		add ax, pposx
		mov dx, pposy
		call ppnochk
		ret
	endp
	wacc proc ;write a character (al) w/color (bl)
		mov bh, 0
		mov cx, 1
		mov ah, 0ah
		int 10h
		mov bh, 0
		mov ah, 03h
		int 10h
		add dl, 1
		c dl, dh
		ret
	endp
	checkcvar proc ;check cvar for generate random color of string
		cmp col_ran_s, 1
		je checkvar_true
			mov dl, col_std_c
			mov cvar1, dl
			ret
		checkvar_true:
		inc cvar1
		cmp cvar1, 16
		jb skip_cvar
			mov cvar1, 1
		skip_cvar:
		ret
	endp
	clearpno proc ;clear a piano notes
		dpnoall
		clearf clearcount
		clearf clearchord
		mov pno_count, 0
		mov cx, 17
		dloop:
		mov bx, cx
		sub bx, 1
		mov pno_strC[bx], 0
		loop dloop
		ret
	endp
	scp proc
		mov ah, 2h
		mov bh, 0
		int 10h
		ret
	endp
	chordplay proc ;proc to play notes chord with beep
		mov bx, 17
		mov timer, 0
		dloops:
		dec bx
		cmp pno_strC[bx], 1
		jne nothings
			mov ax, 2
			mul bx
			mov si, ax
			inc timer
			push notfreq[si]
		nothings:
		cmp bx, 0
		je dlend
		jmp dloops
		dlend:
		pop ax
		play ax
		call wait_delay
		dec timer
		cmp timer, 0
		jne skipey
			ret
		skipey:
		jmp dlend
		ret
	endp
	wait_delay proc ;proc for delay of beep
			mov ah, 00h
			int 01ah
			add dx, delay
			mov bx, dx
		recheck:
			int 01ah
			cmp dx, bx
			jl recheck
		ret
	endp
	checkstat proc ;proc for checking status if user start playing button
		mov ah, 07h
		int 21h
		cmp al, ' '
		je nnotes
			ret
		nnotes:
			cmp pno_count, 0
			jne is_clear
				printf help12, cred, 20, 21
				ret
			is_clear:
			clearf help12
			clearf clearchord
			call cchord
			printf state2, cblu, 10, 21
			call chordplay
			printf state1, clgr, 10, 21
			stop
			ret
	endp	
	inputread proc ;input read for drwa piano and status in pianoplay state
		notesc:
		call checkcvar
		printf head1, cvar1, 16, 0
		printf help4, cvar1, 2, 15
		printf help5, cvar1, 2, 17
		printf help7, cvar1, 2, 21
		mov al, pno_count
		add al, '0'
		mov bl, cvar1
		c 10,17
		call wacc
		call checkstat
		cmp al, 27
		jne skipths
		jmp exinput
		skipths:
		cmp al, 8
		jne skipths1
		call clearpno
		jmp notesc
		skipths1:
		mov cx, 17
		checknotes:
			mov bx, cx
			sub bx, 1
			cmp al, pno_strA[bx]
			je thisnotes
			cmp al, pno_strB[bx]
			je thisnotes
		loop checknotes
		jmp notesc
		thisnotes:
			cmp pno_strC[bx], 1
			je unpushed
				cmp pno_count, 5
				jb allowed1
					printf help8, cred, 12, 17
					jmp notesc
				allowed1:
				mov pno_strC[bx], 1
				mov al, 4
				mul bl
				inc pno_count
				dpnoa al, pc_d
				jmp pushed
			unpushed:
				cmp pno_count, 4
				jne allowed2
					clearf help8
				allowed2:
				mov pno_strC[bx], 0
				mov al, 4
				mul bl
				dec pno_count
				dpnoa al, pc_u
			pushed:
			
		jmp notesc
		exinput:
		ret
	endp
	menu proc ;main menu proc
		svm
		loop_menu:
		printf head1, cvar1, 16, 3
		printf head2, cvar1, 8, 22
		printf menu2, cvar1, 14, 9
		printf menu3, cvar1, 14, 10
		printf menu4, cvar1, 14, 11
		printf menu5, cvar1, 14, 12
		printf help1, cvar1, 14, 14
		call checkcvar
		mov ah, 07h
		int 21h
		cmp al, 27 ;esc
		jne skip_menu1
			jmp exitall
		skip_menu1:
		cmp al, '1' ;playPiano
		jne skip_menu3
			jmp screen_play
		skip_menu3:
		cmp al, '2' ;about
		jne skip_menu4
			jmp screen_about
		skip_menu4:
		cmp al, '3' ;setting
		jne skip_menu5
			jmp screen_setting
		skip_menu5:
		cmp al, '4' ;help
		jne skip_menu6
			jmp screen_help
		skip_menu6:
		jmp loop_menu
		ret
	endp
	p_set_str proc ;proc for setting menu
		printf nmenu2, cvar1, 2,2
		printf set0, cvar1, 2, 7
		printf set1, cvar1, 2, 5
		printf set2, cvar1, 2, 9
		printf set3, cvar1, 2, 11
		printf set4, cvar1, 2, 13
		printf set5, cvar1, 2, 15
		printf set6, cvar1, 2, 17
		printf set7, cvar1, 2, 19
		cmp prefix, 0
		jne pref_flat
			printf pref_s, cvar1, 31,  17
		jmp pref_sharp
		pref_flat:
			printf pref_f, cvar1, 31,  17
		pref_sharp:
		cmp col_ran_s, 0
		jne skiprtc1
			printf t_false, cvar1, 31, 5
			jmp skiprtc2
		skiprtc1:
		printf t_true, cvar1, 31, 5
		skiprtc2:
		c 31, 19
		mov ax, delay
		add al, '0'
		mov bl, cvar1
		call wacc
		ret
	endp
	cchord1 proc ;proc for searching chord with count 1 or 2
		push ax
		mov bx, 0
		alop1:
			mov dx, pno_chord
			and dx, 100000000000b
			cmp dx, 100000000000b
			je alop2
			inc bx
			shl pno_chord, 1
		jmp alop1
		alop2:
		mov ax, 6
		mul bx
		add al, prefix
		mov si, ax
		push bx
		printf chord_notesA[si], cvar1, 10, 15
		pop bx
		pop ax
		cmp al, 2
		je cont
			ret
		cont:
		shl pno_chord, 1
		inc bx
		alop3:
			mov dx, pno_chord
			and dx, 100000000000b
			cmp dx, 100000000000b
			je alop4
			inc bx
			shl pno_chord, 1
		jmp alop3
		alop4:
		mov ax, 6
		mul bx
		add al, prefix
		mov si, ax
		printf chord_notesA[si], cvar1, 13, 15
		ret
	endp
	cchord proc ;proc for searching chord with count 3 - 5
		mov bx, 0
        mov al, 0
        mov di, 0
        mov pno_chord, 0
        sloop:
            shl pno_chord, 1    
            cmp bx, 4
            ja single
                cmp pno_strC[bx], 1
                je dtrue
                cmp pno_strC[bx+12], 1
                je dtrue
                    jmp eloop
                dtrue:
                    inc pno_chord
                    inc al
                jmp eloop
            single:
                cmp pno_strC(bx), 1
                je strue
                    jmp eloop
                strue:
                    inc pno_chord
                    inc al
        eloop:
        inc bx
        cmp bx, 12
        jb sloop
        cmp al,5
        jbe stchk0
            jmp stchknull
        stchk0:
        cmp al,2;1-Notes
        ja stchk2
            call cchord1
            jmp stchkend
        stchk2:
        cmp al,3;3-Notes
		jae initsi
			jmp stchknull
		initsi:
		mov di, 0
		chkths:
		    mov si, 0
			mov bx, 0
			chkloop:
			cmp chord[bx], 0
			jne docheck
			    call roll
			    cmp di, 12
			    jb chkths
			    jmp stchknull
			docheck:
				mov ax, pno_chord
				cmp chord[bx], ax
				jne nextchk
				    mov ax, 6
					mul di
					add al, prefix
					mov di, ax
					printf chord_notesA[di], cvar1, 10, 15
					printf chord_str[si], cvar1, 12, 15
					ret
				nextchk: 
			add bx, 2
			add si, 16
			jmp chkloop
        stchknull:
            printf help13, cvar1, 10, 15
		stchkend:
		ret
    endp
    roll proc ;pno_chord roll function
        mov ax, pno_chord
        and ax, 800h
        cmp ax, 0
        je chckchd
            shl pno_chord, 1
            inc pno_chord
            inc di
        chckchd:
            mov ax, pno_chord
            ;0000 0010 0011 0101
            ;0000 1000 0000 0000
            ;0    8    0    0
            and ax, 800h
            cmp ax, 0
            jne hightrue
            shl pno_chord, 1
            inc di
        jmp chckchd
        hightrue:
        and pno_chord, 0FFFh
        ret
    endp
.STARTUP ;main function
	menu_jump:
	call menu
	screen_play:
	svm
	dpnoall
	printf help1, cred, 2, 24
	printf help2, cgrn, 13, 24
	printf help3, cylw, 26, 24
	printf state1, clgr, 10, 21
	call inputread
	jmp menu_jump
	screen_about:
	svm
	printf nmenu1, cvar1, 2,2
	printf help9, cvar1, 2, 22
	printf nabout2, cvar1, 2,6
	printf nabout3, cvar1, 2,7
	printf nabout4, cvar1, 2,8
	printf nabout5, cvar1, 2,9
	printf nabout6, cvar1, 2,10
	printf nabout7, cvar1, 2,11
	printf nabout8, cvar1, 2,12
	call checkcvar
	mov ah, 07h
	int 21h
	cmp al, 27
	jne skip_about
		jmp menu_jump
	skip_about:
	;menu condition
	jmp screen_about;
	screen_setting:
	svm
	b1 = 55
	b1s = b1 + 7
	b2 = b1s + 9
	b2s = b2 + 7
	b3 = b2s + 9
	b3s = b3 + 7
	b4 = b3s + 9
	b4s = b4 + 7
	b5 = b4s + 9
	b5s = b5 + 7
	printf help9, cblu, 2, 22
	printf help10, cylw, 24, 22
	screen_setting_in:
	dbl col_std_c, 247,b1,279,b1s
	dbl pn_cnat_u, 247,b2,279,b2s
	dbl pn_cnat_d, 247,b3,279,b3s
	dbl pn_cshr_u, 247,b4,279,b4s
	dbl pn_cshr_d, 247,b5,279,b5s
	call checkcvar
	call p_set_str

	;Screen Setting Lies Here!
	mov ah, 07h
	int 21h
	cmp al, 27
	jne skip_setting0
		jmp menu_jump
	skip_setting0:
	cmp al, '1' ;RTC
	jne skip_setting1
		cmp col_ran_s, 1
		je crs1
			mov col_ran_s, 1
			mov ah, cvar1
			jmp screen_setting_in
		crs1:
			mov col_ran_s, 0
			mov ah, col_std_c
			jmp screen_setting_in
	skip_setting1:
	cmp al, '2' ;STC
	jne skip_setting2
		inc col_std_c
		cmp col_std_c, 16
		jb skip_stc
			mov col_std_c, 1
		skip_stc:
		jmp screen_setting_in
	skip_setting2:
	cmp al, '3' ;NCNU
	jne skip_setting3
		inc pn_cnat_u
		cmp pn_cnat_u, 16
		jb skip_stc
			mov pn_cnat_u, 1
		skip_ncnu:
		jmp screen_setting_in
	skip_setting3:
	cmp al, '4' ;NCNP
	jne skip_setting4
		inc pn_cnat_d
		cmp pn_cnat_d, 16
		jb skip_ncnp
			mov pn_cnat_d, 1
		skip_ncnp:
		jmp screen_setting_in
	skip_setting4:
	cmp al, '5' ;NCSU
	jne skip_setting5
		inc pn_cshr_u
		cmp pn_cshr_u, 16
		jb skip_ncsu
			mov pn_cshr_u, 1
		skip_ncsu:
		jmp screen_setting_in
	skip_setting5:
	cmp al, '6' ;NCSP
	jne skip_setting6
		inc pn_cshr_d
		cmp pn_cshr_d, 16
		jb skip_ncsp
			mov pn_cshr_d, 1
		skip_ncsp:
		jmp screen_setting_in
	skip_setting6:
	cmp al, '7' ;Prefix
	jne skip_setting7
		cmp prefix, 0
		je is_zero
			mov prefix, 0
		jmp prefix_fine
		is_zero:
			mov prefix, 72
		prefix_fine:
	skip_setting7:
	cmp al, '8' ;Delay
	jne skip_setting8
		inc delay
		cmp delay, 10
		jb delay_fine
		mov delay, 2
		delay_fine:
	skip_setting8:
	cmp al, 8 ;reset
	jne skip_Setting9
		mov pn_cnat_u, cwht ;Piano Color for Natural Note Up/Unpressed
		mov pn_cshr_u, clgy ;Piano Color for Sharp Note Up/Unpressed
		mov pn_cnat_d, clgy ;Piano Color for Natural Note Down/Pressed
		mov pn_cshr_d, cdgy ;Piano Color for Sharp Note Down/Pressed
		mov col_std_c, cwht
		mov col_ran_s, 1
	skip_setting9:
	jmp screen_setting_in
	screen_help:
	svm
	printf nmenu3, cvar1, 2,2
	printf help9, cvar1, 2, 22
	printf nhelp1, cvar1, 2,4 
	printf nhelp2, cvar1, 2,6
	printf nhelp3, cvar1, 2,8
	printf nhelp4, cvar1, 2,10
	printf nhelp5, cvar1, 2,12
	printf nhelp6, cvar1, 2,14
	;Screen Help Lies Here!
	call checkcvar
	mov ah, 07h
	int 21h
	cmp al, 27
	jne skip_help
		jmp menu_jump
	skip_help:
	;menu condition
	jmp screen_help;
	exitall:
	svm
.EXIT
END
