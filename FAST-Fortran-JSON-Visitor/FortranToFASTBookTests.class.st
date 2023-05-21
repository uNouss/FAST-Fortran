Class {
	#name : #FortranToFASTBookTests,
	#superclass : #FortranToFASTTestSetUp,
	#category : #'FAST-Fortran-JSON-Visitor-Tests'
}

{ #category : #tests }
FortranToFASTBookTests >> testBorbk [

	result := self parse: '
      subroutine borbk(lib,name,title)
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character *(*) name
      character *(*) title

c use of external for functions
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur

c local variables
cESO  pointeur lb.tlib
cESO  pointeur ur.user
      integer ibk,iur
       
      write(*,*) ''borbk: begin''

c activate structure get the first segment and sizes of arrays
      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 

c see whether the user and the book exist in the structure       
      iur = findur(lib,name)
      if (iur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      ibk = findbk(lib,title)
      if (ibk .eq. 0) then 
         write(*,*) '' book'',title,'' does not exist''
         return
      end if 

c set flag true if the book is borrowed    
      ESOar(ESOat(lb,bstatu),brcnt) = .true.

c add the book borrowed to the array  
      ur = mypnt(lib,iur)    
cESO  segact, ur
      ubbcnt = ESOsl(ESOat(ur,ubb),1)
      ubbcnt = ubbcnt + 1
cESO  segadj, ur
      ESOar(ESOat(ur,ubb),ubbcnt) = ibk       
cESO  segdes, ur*mod

c desactivate head segment  
cESO  segdes,lb*mod

c desactivate structure
      call desstr(lib, ''mod'')
      write(*,*) ''borbk: end''
                    
      end
 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testFindbk [

	result := self parse: '
      integer function findbk(lib,title)
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character*(*) title

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

     
c local variables

cESO  pointeur bk.book
cESO  pointeur lb.tlib
      integer ibk
      character*200 fndnam
      logical bkflag

      bkflag = .false.

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb       
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1)
  
      do ibk=1, brcnt
        bk = mypnt(lib,ESOar(ESOat(lb,bref),ibk))
cESO    segact, bk
        write(*,*) ''bk'', bk
c       write(*,*) ''book title'', bk.btitle
        fndnam = ESOat(bk,btitle)
cESO    segdes, bk*nomod
        if (trim(fndnam) .eq. trim(title)) then
          bkflag = .true.
          goto 100
        end if
      end do

 100  continue
cESO  segdes, lb*nomod
      call desstr(lib,''nomod'')

      if (bkflag) then
        findbk = ibk
      else
        findbk = 0
      end if
 
      end

 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testFindur [

	result := self parse: '
      integer function findur(lib,name) 
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character*(*) name

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local variables    
      integer iur 
      character*200 fndnam     
cESO  pointeur ur.user
cESO  pointeur lb.tlib
      logical urflag

      urflag = .false.

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb       
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1) 
        
      do iur=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),iur))
cESO    segact, ur
        ubbcnt = ESOsl(ESOat(ur,ubb),1)
c       write(*,*) "user name", ur.uname
        fndnam = ESOat(ur,uname)
cESO    segdes, ur*nomod
     
     
      if (trim(fndnam) .eq. trim(name)) then
          urflag = .true.
          goto 100
        end if
      end do

 100  continue
cESO  segdes, lb*nomod
      call desstr(lib,''nomod'')

      if (urflag) then
        findur = iur
      else
        findur = 0
      end if
 
      end

 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testLibpnt [

	result := self parse: '
      subroutine libprt(lib)
      implicit none

c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy argument
cESO  pointeur lib.pstr

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local variables     
cESO  pointeur lb.tlib
cESO  pointeur bk.book
cESO  pointeur ur.user

c ibk number of books
c iur number of users
c ibor number of borrowed books
      integer ibk,iur,ibor

      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb  
  
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 
  
      do ibk=1, brcnt
        bk = mypnt(lib,ESOar(ESOat(lb,bref),ibk))
cESO    segact, bk
        write(*,*)''book num'',ibk, ESOat(bk,btitle), ESOat(bk,bpages), ESOat(bk,budc)
cESO    segdes, bk*nomod
      end do

c we search in the structure for users and print their names
c pages and udc
      do iur=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),iur))
cESO    segact, ur
        write(*,*)''user num'',iur, ESOat(ur,uname)

c we print the books borrowed by the user
        ubbcnt = ESOsl(ESOat(ur,ubb),1)
        do ibor=1,ubbcnt
          bk = ESOar(ESOat(ur,ubb),ibor)
cESO      segact, bk
          write(*,*) ''>> book'', ESOat(bk,btitle), ESOat(bk,bpages), ESOat(bk,budc)

cESO      segdes, bk*nomod
        end do

cESO    segdes, ur*nomod
      end do

c we print the user who borrwed books and the number of books
c borrowed    
      do ibor=1, urcnt
        ur = mypnt(lib,ESOar(ESOat(lb,uref),ibor))

        write(*,*)''user num'',iur,ESOar(ESOat(ur,ubb),ibor)
cESO    segdes, ur*nomod
      end do
c desactivate head segment
cESO  segdes, lb*nomod

c desactivate structure
      call desstr(lib,''nomod'')

      end


 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testMain [

	result := self parse: '
      program main
      implicit none

c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c lib structure pstr      
cESO  pointeur lib.pstr
      
     
      write(*,*) ''main: begin''
      
      call ooossg 

      call newlib(lib)  
   
      call newbook(lib,''le petit chaperon rouge'',10,2.12)   

      call newbook(lib,''croc blanc'',100,4.15) 

      call newuser(lib,''emilie'')

      call newuser(lib,''mike'')
     
      call borbk (lib,''mike'', ''croc blanc'')
   
      call relbk(lib, ''mike'', ''croc blanc'')

      call libprt (lib)
          
      call ooostp

      write(*,*) ''main: end''
      end
 '.

	self assert: result isCollection
]

{ #category : #tests }
FortranToFASTBookTests >> testNewbook [

	result := self parse: '
      subroutine newbook(lib,title,pages,udc)
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character*(*) title
      integer pages
      real udc

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

c local vriables       
      integer jord    
cESO  pointeur lb.tlib
cESO  pointeur bk.book

            
      write(*,*) ''newbook: begin''

c activate struct
      call actstr(lib) 

c segini book segment           
cESO  segini, bk
      write(*,*) ''newlib: bk''
      ESOat(bk,btitle) = title
      ESOat(bk,bpages) = pages
      ESOat(bk,budc)   = udc
cESO  segdes, bk*mod

c add the segment to the structure  
      call ajpnt(lib,bk,''book '',0,jord)

c get pointeur of segment
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 
      brcnt = brcnt + 1
cESO  segadj, lb
      ESOar(ESOat(lb,bref),brcnt) = jord
      ESOar(ESOat(lb,bstatu),brcnt) = .false.
cESO  segdes, lb*mod

c desactivate struct       
      call desstr(lib,''mod'') 

      end 
 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testNewlib [

	result := self parse: '
      subroutine newlib(lib)
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


cESO  pointeur lib.pstr
cESO  pointeur lb.tlib
      integer jord

      brcnt  = 0
      urcnt  = 0
    
      write(*,*) ''newlib: begin''
       
c initialize struct
      call inistr(lib,''test'',3,0)

c activate struct
      call actstr(lib)

      write(*,*) ''newlib: inistr''

c segini head segment
cESO  segini, lb
cESO  segdes, lb*mod
      write(*,*) ''newlib: tlib''

c add the segment to the structure  
      call ajpnt(lib,lb,''tlib'',1,jord)
      write(*,*) ''newlib: jord'', jord

c desactivate struct
      call desstr(lib,''mod'') 
    
      write(*,*) ''newlib: end''

      
      end

 '.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testNewuser [

	result := self parse: '
      subroutine newuser(lib,name)
      implicit none


c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c pointeur segment
cESO  pointeur lib.pstr
      character *(*) name 

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt

          
c number of segment added
      integer  jord
cESO  pointeur lb.tlib
cESO  pointeur ur.user
     
      write(*,*) ''newuser: begin''

c activate the structure
      call actstr(lib)   

c the user doesnt have a book yet 
      ubbcnt = 0
c segini user segment
cESO  segini, ur
      write(*,*) ''newlib: usr''

c add the name of the user
      ESOat(ur,uname) = name
cESO  segdes, ur*mod

c add the segment to the structure  
      call ajpnt(lib,ur,''user  '',0,jord)

c get pointeur of segment
      lb = mypnt(lib,1)
cESO  segact, lb
      urcnt = ESOsl(ESOat(lb,uref),1)
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = urcnt + 1
cESO  segadj, lb
      ESOar(ESOat(lb,uref),urcnt) = jord
cESO  segdes, lb*mod

c desactivate struct       
      call desstr(lib,''mod'') 

      write(*,*) ''newuser: end''
      end 

'.

	self assert: result isCollection 
]

{ #category : #tests }
FortranToFASTBookTests >> testRelbk [

	result := self parse: '
      subroutine relbk(lib,name,title)
      implicit none
c2345678901234567890123456789012345678901234567890123456789012
c bref(brcnt) array of books
c uref(urcnt) array of users
c bstatu(brcnt) logical array of borrowed books
c ubb(ubbcnt) array of books borrowed by the user

c: MAILLON 1
      integer brcnt
      integer urcnt
      integer ubbcnt

c segment de tête
cESO  segment, tlib
        integer bref(brcnt)
        logical bstatu(brcnt)
        integer uref(urcnt)
cESO  end segment

cESO  segment, book
        character*40 btitle
        integer bpages
        real budc
cESO  end segment

cESO  segment, user
        character*40 uname
        integer ubb(ubbcnt)
cESO  end segment

c******************************************************************

c2345678901234567890123456789012345678901234567890123456789012
c-pstr
c:pstr   segment dentete des structures : nouvelles definition
*:nomcod nom du code auquel appartient la structure (cronos, apollo, ..)
*:date   date de debut de job
*:heure  heure de debut de job
*:typseg type des segments appartenants a la structure
*:typref type des objects references par la structure
*:ibseg  numero max. du segment ajoute a la structure
*:ibref  numero max. de lobject reference par la structure
*:pntseg pointeurs des segments apartenants a la structure
*:pntref pointeurs des objects references par la structure
cESO  segment, pstr
        character*8 nomcode, date, heure, typseg(nbseg), typref(nbref)
        integer     ibseg, ibref,         pntseg(nbseg), pntref(nbref)
cESO  endsegment
*-------------------------------------------------------------


c dummy arguments
cESO  pointeur lib.pstr
      character *(*) name
      character *(*) title

c use of external for mypnt since it is a function
      external mypnt
      integer mypnt
      external findbk 
      integer findbk
      external findur
      integer findur

c local vriables       
cESO  pointeur lb.tlib
cESO  pointeur ur.user
cESO  pointeur bk.book
      integer ir
      integer ibk

      write(*,*) ''relbk: begin''

c activate struct
      call actstr(lib)
      lb = mypnt(lib,1)
cESO  segact, lb
      brcnt = ESOsl(ESOat(lb,bref),1)
      urcnt = ESOsl(ESOat(lb,uref),1) 

c call of the function that find the user and check whether
c it belongs to the structure or not and the same thing for the book       
      ur = findur(lib,name)
      if (ur .eq. 0) then 
         write(*,*) '' user'',name,'' does not exist''
         return
      end if 
      ibk = findbk(lib,title)
      if (ibk .eq. 0) then 
         write(*,*) '' book'',title,'' does not exist''
         return
      end if 

c activate the segment user and get the size of the array ubb       
cESO  segact, ur
      ubbcnt = ESOsl(ESOat(ur,ubb),1)

c search for the the element that we want to remove from
c the array
      do ir=1, ubbcnt
         if (ESOar(ESOat(ur,ubb),ir) .eq. ibk) then 
           exit                      
         end if  
      end do

c adjust the array 
      do jr=ir , ubbcnt-1
c        ur.ubb(jr) == ur.ubb(jr + 1) -> erreur parsing normal
         ESOar(ESOat(ur,ubb),jr) = ESOat(ur,ubb(jr + 1))
      end do

      ubbcnt = ubbcnt - 1   
cESO  segadj, ur
cESO  segdes, ur*mod

c since the book is no more borrowed set flag on false
      ESOar(ESOat(lb,bstatu),brcnt) = .false.

c desactivate the head segment  
cESO  segdes,lb*mod

c desactivate structure
      call desstr(lib, ''mod'')

      write(*,*) ''borbk: end''
                    
      end

'.

	self assert: result isCollection
]
