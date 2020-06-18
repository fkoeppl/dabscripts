# dabscripts

Some bash scripts for recording DAB ETI files with open source tools.

## Dependencies

- eti-stuff https://github.com/fkoeppl/eti-stuff
- etisnoop https://github.com/Opendigitalradio/etisnoop
- dablin https://github.com/Opendigitalradio/dablin

## Scripts

Recording ETI files with etirec.sh. E.g. for recording a DAB ensemble on channel 7D:

      etirec.sh 7D
      
Scanning through all DAB channels and recording every found DAB ensemble for 5 minutes:
      
      dabscan.sh
      
Getting DAB Label and Ensemble ID from ETI file and print to stdout:
  
      getELABEL.sh example.eti
      

