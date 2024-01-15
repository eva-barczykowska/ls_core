=begin
You have to extract a portion of the file name as follows:

    Assume it will start with date represented as long number
    Followed by an underscore
    You'll have then a filename with an extension
    it will always have an extra extension at the end

Inputs:
1231231223123131_FILE_NAME.EXTENSION.OTHEREXTENSION
1_This_is_an_otherExample.mpg.OTHEREXTENSIONadasdassdassds34
1231231223123131_myFile.tar.gz2

Outputs
FILE_NAME.EXTENSION
This_is_an_otherExample.mpg
myFile.tar
Acceptable characters for random tests:
abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-0123456789

The recommended way to solve it is using RegEx and specifically groups.

PEDAC
P:
- method needs to extract a fragment of the file name
    -start with date represented as long number
    - Followed by an underscore _
    - then a filename with an extension
    - it will always have an extra extension at the end
E:
1231231223123131_FILE_NAME.EXTENSION.OTHEREXTENSION
=> FILE_NAME.EXTENSION

1_This_is_an_otherExample.mpg.OTHEREXTENSIONadasdassdassds34
=> This_is_an_otherExample.mpg

1231231223123131_myFile.tar.gz2
myFile.tar

DS:
input: str
output: str

N:
find

A:
- change to an array
- get rid of date:
- get rid of everything until underscore
-find out the index of underscore
-delete everything until underscore

- get rid of last extention
- reverse and get rid of everything until the first dot
-find out the index of first dot
-delete everything until first dot
- reverse back

join into a string and return

=end

def file_name_extractor(str)
  arr = str.chars
  index_of_underscore = arr.index('_')
  arr.shift(index_of_underscore.next)

  arr = arr.reverse
  index_of_fullstop = arr.index('.')
  arr.shift(index_of_fullstop.next)
  arr = arr.reverse

  arr.join
end

p file_name_extractor("1231231223123131_FILE_NAME.EXTENSION.OTHEREXTENSION") == "FILE_NAME.EXTENSION"
p file_name_extractor("682_gbuueS2kaWtAm1jpNzhdb]lHY.`xB.Qn2h2Lr1[5rNgUveBmXg") == "gbuueS2kaWtAm1jpNzhdb]lHY.`xB"

